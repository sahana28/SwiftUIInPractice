//
//  InterestCellView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 13/09/24.
//

import SwiftUI

struct InterestCellView: View {
    var title : String = "This is title"
    var emoji : String? = "😃"
    var imageIcon : String? = "heart.fill"
    var body: some View {
        HStack(spacing: 4) {
            if let icon = imageIcon {
                Image(systemName: icon)
            }
            else if let emoji {
                Text(emoji)
            }
            Text(title)
                .font(.title3)
                
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .cornerRadius(17)
        
        
    }
}

#Preview {
    VStack {
        InterestCellView(imageIcon: nil)
        InterestCellView()
    }
    
}
