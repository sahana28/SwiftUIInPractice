//
//  ImageLoaderView.swift
//  
//
//  Created by Sahana  Rao on 04/09/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString : String = Constants.randomImageURL
    var resizableMode : ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizableMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
        
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
