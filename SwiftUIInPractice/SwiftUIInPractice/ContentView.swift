//
//  ContentView.swift
//  
//
//  Created by Sahana  Rao on 03/09/24.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftfulUI
import SwiftfulRouting


struct ContentView: View {

    @Environment(\.router) var router
    
    var body: some View {
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                }
            }
            
            Button("Open Bumble") {
                router.showScreen(.fullScreenCover) { _ in
                    BumbleHomeView()
                }
            }
        }
        
        .padding()
    }

}



#Preview {
    RouterView {_ in 
        ContentView()
    }
    
}
