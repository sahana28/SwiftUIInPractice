//
//  ImageTitleRowCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 09/09/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var title : String = "Titlenmbhyrytyryrytryrtrryr"
    var image : String = Constants.randomImageURL
    var imageHeight : CGFloat = 100
    var imageWidth : CGFloat = 100
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ImageLoaderView(urlString: image)
                .frame(width: imageWidth, height: imageHeight)
            Text(title)
                .font(.callout)
                .foregroundStyle(Color.spotifyLightGray)
                .padding(4)
                .lineLimit(2)
                
        }
        .frame(width: imageWidth)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
