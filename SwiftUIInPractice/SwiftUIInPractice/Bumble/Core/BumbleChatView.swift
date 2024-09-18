//
//  BumbleChatView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 15/09/24.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatView: View {
    
    @Environment(\.router) var router
    @State private var allUsers : [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleYellowBackground.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                matchedQueueView
                chatsView
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .task {
             await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header : some View {
        HStack(spacing: 0, content: {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer()
            Image(systemName: "magnifyingglass")
        })
        .padding(16)
        .font(.title)
        .fontWeight(.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var matchedQueueView : some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue")
                    .fontWeight(.semibold)
                +
                Text(" (\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16,
                           content: {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                })
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            .frame(height: 100)
        }
    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        do {
            allUsers = try await DatabaseHelper().getUsers()
        }
        catch {
            
        }
    }
    
    private var chatsView : some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Group {
                    Text("Chats")
                        .fontWeight(.semibold)
                    +
                    Text(" (Recent)")
                        .foregroundStyle(.bumbleGray)
                }
                
                Spacer()
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
                
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16,
                           content: {
                    ForEach(allUsers) { user in
//                                BumbleProfileImageCell(
//                                    imageName: user.image,
//                                    percentageRemaining: Double.random(in: 0...1),
//                                    hasNewMessage: Bool.random()
                      //  )
                        
                        BumbleChatPreviewCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessages: Bool.random(),
                            userName: user.firstName,
                            lastMessage: user.about,
                            isYourMove: Bool.random()
                        )
                    }
                })
                .padding(16)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    RouterView { _ in
        BumbleChatView()
    }
    
}
