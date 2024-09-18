//
//  PlaylistDescriptionCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 10/09/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText : String = Product.mock.description
    var username: String = "Sahana"
    var subheadline : String = "Some headline goes here"
    var onAddtoPlaylistPressed : (() -> Void)? = nil
    var onDownloadPressed : (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed : (() -> Void)? = nil
    var onShufflePressed : (() -> Void)? = nil
    var onPlayPressed : (() -> Void)? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
                madeForYouSection
            Text(subheadline)
            buttonsRow
        })
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
        
        
        
    }
    
    private var madeForYouSection : some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
        
                Text("Made for ") + Text(username)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyWhite)
            
        }
    }
    
    private var buttonsRow : some View {
        HStack(spacing: 0, content: {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                    
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8, content: {
                
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                    
                
            })
            .foregroundStyle(.spotifyGreen)
            
        })
        .font(.title2)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        PlaylistDescriptionCell()
            .padding()
    }
    
}
