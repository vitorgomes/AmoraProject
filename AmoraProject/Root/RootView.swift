//
//  RootView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 02/10/25.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab: TabItem = .feed
    @State private var navigationPath: [NavigationDestination] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Group {
                    switch selectedTab {
                    case .feed:
                        FeedView(navigationPath: $navigationPath)
                    case .search:
                        SearchView()
                    case .newPost:
                        NewPostView()
                    case .reels:
                        ReelsView()
                    case .profile:
                        ProfileView()
                    }
                }
                
                VStack {
                    Spacer()
                    customTabBar
                }
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .notifications:
                    NotificationsView(navigationPath: $navigationPath)
                        .navigationBarHidden(true)
                case .messages:
                    MessagesView(navigationPath: $navigationPath)
                        .navigationBarHidden(true)
                case .chat(let userName, let userImage, let isOnline, let lastTimeOnline, let timeUnit):
                    ChatView(userName: userName,
                             userImage: userImage,
                             isOnline: isOnline,
                             lastTimeOnline: lastTimeOnline,
                             timeUnit: timeUnit,
                             navigationPath: $navigationPath)
                    .navigationBarHidden(true)
                }
            }
            .navigationBarHidden(true)
        }
        .ignoresSafeArea(.keyboard)
    }
    
    private var customTabBar: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = tab
                        navigationPath.removeAll()
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: selectedTab == tab ? tab.iconFilled : tab.icon)
                            .font(.system(size: 24))
                            .frame(height: 28)
                    }
                    .foregroundColor(selectedTab == tab ? .primary : .secondary)
                    .frame(maxWidth: .infinity)
                }
                .accessibilityIdentifier("\(tab.title.lowercased())TabItem")
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 4)
        .background(.white)
    }
}

#Preview {
    RootView()
}
