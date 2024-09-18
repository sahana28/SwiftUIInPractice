//
//  ProductRowCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 10/09/24.
//

import SwiftUI

struct ProductRowCell: View {
    var imageName : String = Constants.randomImageURL
    var title : String = "Title"
    var subTitle: String? = "subtitle"
    var imageSize : CGFloat = 50
    var onCellTapped : (() -> Void)? = nil
    var onEllipsisTapped : (() -> Void)? = nil

    var body: some View {
        
        HStack(alignment: .top) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading,spacing: 5) {
                Text(title)
                    .font(.body)
                    .foregroundStyle(.spotifyWhite)
                    .fontWeight(.medium)
                
                if let subTitle {
                    Text(subTitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
                
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisTapped?()
                }
            
        }
        .background(Color.black.opacity(0.001))
        
        .onTapGesture {
            onCellTapped?()
        }
        
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ProductRowCell()
    }
   
}
