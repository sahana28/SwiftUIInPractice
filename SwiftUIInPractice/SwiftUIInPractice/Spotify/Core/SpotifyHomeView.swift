//
//  SpotifyHomeView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 05/09/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

//@Observable
//final class SpotifyViewModel  {
//    
//   var router : AnyRouter
//   var currentUser : User? = nil
//   var products : [Product] = []
//   var productRows : [ProductRow] = []
//    
//    init(router: AnyRouter) {
//        self.router = router
//        
//    }
//    
//   func getData() async {
//        do {
//            self.currentUser = try await DatabaseHelper().getUsers().first
//            self.products = try await Array(DatabaseHelper().getProducts().prefix(8))
//            var rows = [ProductRow]()
//            var allbrands = Set(self.products.map({$0.brand}))
//            for brands in allbrands {
//                // let product = products.filter({$0.brand == brands})
//                rows.append(ProductRow(title: brands?.capitalized ?? "Brand", products: products))
//            }
//            self.productRows = rows
//            
//        } catch {
//            
//        }
//        
//        
//    }
//}

struct SpotifyHomeView: View {
    
   // @State var viewModel : SpotifyViewModel
    @Environment(\.router) var router
    @State private var currentUser : User? = nil
    @State private var selectedCategory : Category? = nil
    @State private var products : [Product] = []
    @State private var productRows : [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 4,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        VStack(spacing: 16) {
                            recentSection
                                .padding(.horizontal, 16)
                            if let firstProduct = products.last {
                                newReleaseSection(product: firstProduct)
                                    .padding(.horizontal, 16)
                                
                            }
                            
                            
                            listRows
                            
                        }
                    } header: {
                        headerView
                    }
                    
                })
                .padding(.top, 8)
                
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func getData() async {
            do {
                self.currentUser = try await DatabaseHelper().getUsers().first
                self.products = try await Array(DatabaseHelper().getProducts().prefix(8))
                var rows = [ProductRow]()
                var allbrands = Set(self.products.map({$0.brand}))
                for brands in allbrands {
                    // let product = products.filter({$0.brand == brands})
                    rows.append(ProductRow(title: brands?.capitalized ?? "Brand", products: products))
                }
                self.productRows = rows
    
            } catch {
    
            }
    
    
        }
    
    private var headerView : some View {
        HStack(spacing: 0) {
            ZStack {
                if let user = currentUser {
                    ImageLoaderView(urlString: user.image)
                    
                        .background(Color.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized,isSelected: selectedCategory == category)
                            .onTapGesture {
                               selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .background(Color.spotifyBlack)
        .padding(.leading, 8)
    }
    
    private var recentSection: some View {
        NonLazyVGrid(columns: 2,spacing: 10, items: products) { product  in
            if let product {
                SpotifyRecentCell(productName: product.title, imageName: product.firstImage)
                    .asButton(.press) {
                        goToPlaylistView(product: product)
                    }
            }
        }
        
    }
    
    private func goToPlaylistView(product: Product) {
        guard let user = currentUser else { return }
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
        
    }
     
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                
            } onPlayPressed: {
                goToPlaylistView(product: product)
            }
        
    }
    
    private var listRows : some View {
        ForEach(productRows) { productRows in
                        VStack(spacing: 8) {
                            Text(productRows.title)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 16)
                            ScrollView(.horizontal) {
                                HStack(alignment: .top,spacing: 16) {
                                    ForEach(productRows.products) { product in
                                        ImageTitleRowCell(title: product.title, image: product.firstImage, imageHeight: 120, imageWidth: 120)
                                            .asButton(.press) {
                                                goToPlaylistView(product: product)
                                            }
                                    }
                                }
                                .padding(.horizontal, 16)
                                
                            }
                            .scrollIndicators(.hidden)
                        }
                    }
                
                }
}

#Preview {
    RouterView { router in
        SpotifyHomeView()
    }
    
}
