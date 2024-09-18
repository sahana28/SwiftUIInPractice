//
//  BumbleHomeView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 11/09/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct BumbleHomeView: View {
    
    @Environment(\.router) var router
    @State var options : [String] = ["Everyone", "Trending"]
    @AppStorage("bumble_home_filter") private var selection = "Everyone"
    @State private var allUsers : [User] = []
    @State private var selectedIndex : Int = 0
    @State private var cardOffsets: [Int:Bool] = [:]  // UserId : (Direction is right == TRUE)
    @State private var offset : CGFloat = 0
    @State private var currentSwipeOffset : CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 12) {
                header
                BumbleFilterView(options: options, selection: $selection)
                    .background(Divider(), alignment: .bottom)
                 
                
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id: \.offset) { (index, user) in
                            
                            let isPreviousIndex = (selectedIndex - 1) == index
                            let isCurrentIndex = selectedIndex == index
                            let nextIndex = (selectedIndex + 1) == index
                            
                            if isPreviousIndex || isCurrentIndex || nextIndex {
                                let offsetValue = cardOffsets[user.id]
                                
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x : offsetValue == nil ? 0 : (offsetValue == true ? 900 : -900)  )
                            }
                            
                        }
                        
                    }
                    else {
                        ProgressView()
                    }
                    
                    overlaySwipeIndicator
                        .zIndex(99999)
                }
                .frame(maxHeight: .infinity)
                .padding(4)
                .animation(.smooth, value: cardOffsets)
                
            }
            .padding(8)
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
        
    }
    
    private func userDidSelect(index: Int, isLike: Bool) {
        let user = allUsers[index]
        cardOffsets[user.id] = isLike
        selectedIndex += 1
    }
    
    private var header : some View {
        HStack(spacing: 0, content: {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(Color.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    router.showScreen(.push) { _ in
                        BumbleChatView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            
        })
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(Color.bumbleBlack)
    }
    
    private var overlaySwipeIndicator : some View {
        ZStack {
            Circle()
                .fill(Color.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0 )
                .offset(x: min(-currentSwipeOffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .fill(Color.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0 )
                .offset(x: max(-currentSwipeOffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .animation(.smooth, value: currentSwipeOffset)
    }
    
    private func userProfileCell(user: User, index: Int) -> some View  {
        //        Rectangle()
        //            .fill((index % 2 == 0) ? Color.blue : Color.green)
        //            .overlay (
        //                Text("\(currentSwipeOffset)")
        //            )
        BumbleCardView(
            user: user,
            onSuperLikePressed: nil,
            onXMarkPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onCheckMarkPressed: {
                userDidSelect(index: index, isLike: true)
            },
            onSendAComplimentPressed: nil,
            onHideAndReportPressed: {
                
            }
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 10,
            resets: true,
            //                                        animation: <#T##Animation#>,
            rotationMultiplier: 1.05,
            scaleMultiplier: 0.8,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
            },
            onEnded: { dragOffset in
                if dragOffset.width > 50 {
                    userDidSelect(index: index, isLike: true)
                }
                else if dragOffset.width < -50 {
                    userDidSelect(index: index, isLike: false)
                }
            }
        )
    }
    
    
    func getData() async {
        
        guard allUsers.isEmpty else { return }
        do {
            self.allUsers = try await DatabaseHelper().getUsers()
            
        } catch {
            
        }
        
        
    }
}

#Preview {
    RouterView { router in
        BumbleHomeView()
    }
}
