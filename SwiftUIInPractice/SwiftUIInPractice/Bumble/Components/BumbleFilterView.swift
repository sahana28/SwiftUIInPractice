//
//  BumbleFilterView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 11/09/24.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options : [String] = ["Everyone", "Trending"]
    @Binding var selection : String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(options, id: \.self) { option in
                VStack(spacing: 8) {
                    Text(option)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                 }
                .padding(.top, 8)
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selection == option ? Color.bumbleBlack : Color.bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreview : View {
    var options : [String] = ["Everyone", "Trending"]
    @State private var selection = "Everyone"
    
    var body : some View {
        BumbleFilterView(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
}
