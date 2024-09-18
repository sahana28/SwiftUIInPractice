//
//  BumbleCardView.swift
//  SwiftUIInPractice
//
//  Created by Sahana  Rao on 13/09/24.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var user: User = .mockUser
    var onSuperLikePressed : (() -> Void)? = nil
    var onXMarkPressed : (() -> Void)? = nil
    var onCheckMarkPressed : (() -> Void)? = nil
    var onSendAComplimentPressed : (() -> Void)? = nil
    var onHideAndReportPressed : (() -> Void)? = nil
    @State var cardFrame: CGRect = .zero
    
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0,
                       content: {
                
                headerViewCell
                    .frame(height: self.cardFrame.height)
                aboutMeSection
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
                
                myInterestsSection
                
                ForEach(user.images, id: \.self) { image in
                     ImageLoaderView(urlString: image)
                        .frame(height: self.cardFrame.height)
                        .padding(.vertical, 20)
                }
                
                locationSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                footerSection
                    .padding(.vertical, 60)
                    .padding(.horizontal, 32)
            
            })
        }
        .scrollIndicators(.hidden)
        .background(Color.bumbleYellowBackground)
        .overlay(alignment: .bottomTrailing, content: {
            superlikeButton
        })
        .cornerRadius(30)
        .readingFrame { frame in
            self.cardFrame = frame
        }
        
       
    }
    
    private var superlikeButton : some View {
        Image(systemName: "hexagon.fill")
            .font(.system(size: 60))
            .foregroundStyle(.bumbleYellow)
            .overlay {
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundStyle(.bumbleBlack)
            }
            .onTapGesture {
                onSuperLikePressed?()
            }
            .padding(24)
    }
    private var locationSection : some View {
        VStack(alignment: .leading,spacing: 12, content: {
            HStack(spacing: 8, content: {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text("\(user.firstName)'s Location")
                
            })
            
            .font(.body)
            .fontWeight(.semibold)
            .foregroundStyle(.bumbleGray)
            
            Text("10 miles away")
                .font(.headline)
                .foregroundStyle(.bumbleBlack)
            
            InterestCellView(title: "Lives in New York, NY",emoji: "🇺🇸", imageIcon: nil)
            
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var myInterestsSection : some View {
        VStack(alignment: .leading,spacing: 12, content: {
            VStack(alignment: .leading, spacing: 8, content: {
                sectionTitle(title: "My basics")
                InterestPillGridView(interests: user.basics)
                
            })
            VStack(alignment: .leading, spacing: 8, content: {
                sectionTitle(title: "My interests")
                InterestPillGridView(interests: user.interests)
            })
        })
    }
    
    private var aboutMeSection : some View {
        VStack(alignment: .leading, spacing: 12, content: {
            sectionTitle(title: "About Me")
                
            Text(user.about)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            HStack(spacing: 0, content: {
                BumbleHeartView()
                
                Text("Send a compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
                    
                
            })
            .padding([.horizontal, .trailing], 8)
            .background(.bumbleYellow)
            .cornerRadius(32)
            .onTapGesture {
                onSendAComplimentPressed?()
            }
            
            
        })
    }
    
    private var footerSection : some View {
        VStack(spacing: 24, content: {
            HStack(spacing: 0, content: {
                
                Circle()
                    .fill(Color.bumbleYellow)
                    .frame(width: 60, height: 60)
                    .overlay {
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .onTapGesture {
                        onXMarkPressed?()
                    }
                
                Spacer(minLength: 0)
                Circle()
                    .fill(Color.bumbleYellow)
                    .frame(width: 60, height: 60)
                    .background(Color.black.opacity(0.001))
                    .overlay {
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                    }
                    .onTapGesture {
                        onCheckMarkPressed?()
                    }
                
            })
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .onTapGesture {
                    onHideAndReportPressed?()
                }
            
            
        })
    }
    
    private func sectionTitle(title:String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }
    
    private var headerViewCell : some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(urlString: user.image)
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing: 4)  {
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                BumbleHeartView()
                    .onTapGesture {
                        onSuperLikePressed?()
                    }
                
            }
            .padding(24)
            //.background(Color.red)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        Color.bumbleBlack.opacity(0),
                        Color.bumbleBlack.opacity(0.6),
                        Color.bumbleBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
                
        }
        
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
