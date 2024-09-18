//
//  BumbleHeartView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 13/09/24.
//

import SwiftUI

struct BumbleHeartView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.bumbleYellow)
                .frame(width: 40, height: 40)
            Image(systemName: "bubble.fill")
                .foregroundStyle(.bumbleBlack)
                .font(.system(size: 22))
                .offset(y: 2)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: 10))
            
        }
    }
}

#Preview {
    BumbleHeartView()
}
