//
//  SpotifyNewReleaseCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 07/09/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName : String = Constants.randomImageURL
    var headline : String? = "New release from"
    var subheadline : String? = "Some artist"
    var title : String? = "Some playlist"
    var subtitle : String? = "Single - title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed : (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                  
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading,spacing: 32) {
                    VStack(alignment: .leading,spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                            
                        }
                        if let subtitle {
                            Text(subtitle)
                                .font(.callout)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title)
                            
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8.0)
            .onTapGesture {
                onPlayPressed?()
            }
            
        }
        
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
