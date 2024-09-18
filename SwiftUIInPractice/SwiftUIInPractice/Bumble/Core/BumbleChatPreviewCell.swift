//
//  BumbleChatPreviewCell.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 15/09/24.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    var imageName : String = Constants.randomImageURL
    var percentageRemaining : Double = Double.random(in: 0...1)
    var hasNewMessages : Bool = true
    var userName : String = "Rahul"
    var lastMessage : String? = "Hello honey"
    var isYourMove : Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(
                imageName: imageName,
                percentageRemaining: percentageRemaining ,
                hasNewMessage: hasNewMessages
            )
            
            VStack(alignment: .leading){
                HStack(spacing: 0) {
                    Text(userName)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    if isYourMove {
                        ZStack {
                            Rectangle()
                                .fill(.bumbleYellow)
                                .frame(width: 85, height: 20)
                                .cornerRadius(10)
                            Text("YOUR MOVE")
                                .bold()
                                .font(.caption2)
                        }
                        
                    }
                }
                
                if let lastMessage {
                    Text(lastMessage)
                        
                        .font(.callout)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
                
            }
            .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    BumbleChatPreviewCell()
        .padding()
}
