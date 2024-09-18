//
//  BumbleProfileImageCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 15/09/24.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    
    var imageName: String = Constants.randomImageURL
   // var percentageRemaining : Double = Double.random(in: 0...1)
    var percentageRemaining : Double = 0.3
    var hasNewMessage : Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(.degrees(-90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)

        }
        .frame(width: 75, height: 75)
        .overlay {
            ZStack(alignment: .bottomTrailing, content: {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(5)
                    
                }
                
            }
            )
            .frame(width: 30, height: 30)
            .offset(x: 28, y:20)
        }
    }
}

#Preview {
    VStack {
        BumbleProfileImageCell()
        BumbleProfileImageCell(percentageRemaining: 0.6)
        BumbleProfileImageCell(percentageRemaining: 0.4)
    }
    
    
}
