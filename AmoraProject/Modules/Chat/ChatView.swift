//
//  ChatView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(mode: .chat(userName: "funnyCats",
                                       userImage: "catPhoto",
                                       isOnline: false,
                                       lastTimeOnline: 1,
                                       timeUnit: "h"),
                           geometry: geometry)
                ScrollView {
                    LazyVStack(spacing: 2) {
                        HStack {
                            Spacer()
                            
                            FirstBubbleMessageSentView(text: "Test",
                                                   geometry: geometry)
                        }
                        
                        HStack {
                            Spacer()
                            
                            MiddleBubbleMessageSentView(text: "Test",
                                                    geometry: geometry)
                        }
                        
                        HStack {
                            Spacer()
                            
                            LastBubbleMessageSentView(text: "Test",
                                                  geometry: geometry)
                        }
                        
                        HStack(alignment: .bottom) {
                            Image("catPhoto")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(
                                    width: geometry.size.width * 0.1 - 6,
                                    height: geometry.size.width * 0.1 - 6
                                )
                                .clipShape(Circle())
                            
                            VStack {
                                HStack {
                                    FirstBubbleMessageReceivedView(text: "Tests",
                                                                   geometry: geometry)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    MiddleBubbleMessageReceivedView(text: "Test",
                                                                    geometry: geometry)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    LastBubbleMessageReceivedView(text: "Test",
                                                                  geometry: geometry)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                }
                
                ChatTextFieldView()
                    .padding(.horizontal, 8)
            }
        }
    }
}

#Preview {
    ChatView()
}
