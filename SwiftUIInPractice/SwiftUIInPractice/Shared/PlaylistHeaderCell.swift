//
//  PlaylistHeaderCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 09/09/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    var height : CGFloat = 300
    var title : String = "Title "
    var subtitle : String = "Sub title"
    var imageName : String = Constants.randomImageURL
    var shadowColor : Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(ImageLoaderView(urlString: imageName))
            .overlay (
                VStack(alignment: .leading, spacing: 20) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(Color.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                )
                ,alignment: .bottomLeading)
            .asStretchyHeader(startingHeight: height)
            .frame(height: height)
       }
                
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
   
}
