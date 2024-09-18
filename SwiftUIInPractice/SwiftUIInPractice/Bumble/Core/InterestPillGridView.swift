//
//  InterestPillGridView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 14/09/24.
//

import SwiftUI
import SwiftfulUI

struct InterestPillGridView: View {
    
    var interests : [UserInterest] = User.mockUser.interests
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2,alignment: .leading, items: interests, content: { interest in
                if let interest {
                    InterestCellView(title: interest.title, emoji: interest.emoji, imageIcon: interest.imageIcon)
                }
                else {
                    EmptyView()
                }
            })
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        InterestPillGridView(interests: User.mockUser.interests)
        InterestPillGridView(interests: User.mockUser.basics)
    }
    
}
