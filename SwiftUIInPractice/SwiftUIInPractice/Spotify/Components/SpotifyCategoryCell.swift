//
//  SpotifyCategoryCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 05/09/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title : String = "Music"
    var isSelected : Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(16)
            
    }
}

extension View {
    
    func themeColors(isSelected: Bool) -> some View {
        self
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .background(isSelected ? Color.spotifyGreen : Color.spotifyDarkGray)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            SpotifyCategoryCell(title: "All", isSelected: true)
            SpotifyCategoryCell(title: "Long Title",isSelected: true)
            SpotifyCategoryCell(title: "Title")
        }
        
    }
    
}
