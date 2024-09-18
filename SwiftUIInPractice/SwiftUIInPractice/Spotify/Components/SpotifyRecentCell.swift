//
//  SpotifyRecentCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 06/09/24.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var productName : String = ""
    var imageName : String = ""
    var isSelected : Bool = false
    
    var body: some View {
        HStack(spacing: 16) {
        
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            Text(productName)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
                
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: isSelected)
        .cornerRadius(6)
        
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentCell(productName: "iPhone 9", imageName: Constants.randomImageURL)
                SpotifyRecentCell(productName: "Samsung Galaxy Notebook", imageName: Constants.randomImageURL)
            }
            HStack {
                SpotifyRecentCell(productName: "iPhone 6", imageName: Constants.randomImageURL)
                SpotifyRecentCell(productName: "Samsung Universe Notebook", imageName: Constants.randomImageURL)
            }
            
        }
    }
   
}
