//
//  RootView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 02/10/25.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab: TabItem = .feed
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .feed:
                    FeedView()
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
        .ignoresSafeArea(.keyboard)
    }
    
    private var customTabBar: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = tab
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
