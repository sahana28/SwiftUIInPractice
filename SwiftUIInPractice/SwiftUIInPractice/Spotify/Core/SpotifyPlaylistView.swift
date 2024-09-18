//
//  SpotifyPlaylistView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 09/09/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    @Environment(\.router) var router
    var product : Product = .mock
    var user : User = User.mockUser
    @State private var products : [Product] = []
    @State private var showHeader : Bool = true
    
    var body: some View {
        
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(height:250, 
                                       title: product.title,
                                       subtitle: product.category,
                                       imageName:product.thumbnail)
//                    .background(
//                        GeometryReader(content: { geometry in
//                            Text("Content")
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        })
//                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        username: "Sahana",
                        subheadline: product.category,
                        onAddtoPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        ProductRowCell(imageName: product.firstImage,
                                       title: product.title,
                                       subTitle: product.brand,
                                       imageSize: 50,
                                       onCellTapped: {
                            goToPlaylistView(product: product)
                        },
                                       onEllipsisTapped: {
                            
                        })
                        .padding(.leading, 16)
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            header
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async  {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
    private func goToPlaylistView(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
    
    private var header : some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .foregroundStyle(.spotifyWhite)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y:showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
           }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
            .frame(maxHeight:.infinity, alignment: .top)
    }
}

#Preview {
    RouterView { router in
        SpotifyPlaylistView()
    }
}
