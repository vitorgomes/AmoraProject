//
//  NotificationsView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(mode: .notifications)
                    .padding(.bottom, 16)
                    .padding(.leading, 8)
                
                ScrollView {
                    LazyVStack(spacing: 32) {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Hoje")
                                .bold()
                            
                            FollowNotification(geometry: geometry)
                        }
                        
                        VStack(alignment: .leading, spacing: 32) {
                            Text("Últimos 7 dias")
                                .bold()
                            
                            FollowNotification(geometry: geometry)
                            
                            GroupedLikeNotification(geometry: geometry)
                            
                            GroupedLikeNotification(geometry: geometry)
                            
                            SingleLikeNotification(geometry: geometry)
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Últimos 30 dias")
                                .bold()
                            
                            FollowNotification(geometry: geometry)
                            
                            FollowNotification(geometry: geometry)
                            
                            FollowNotification(geometry: geometry)
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    NotificationsView()
}
