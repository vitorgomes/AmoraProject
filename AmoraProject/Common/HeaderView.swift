//
//  HeaderView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

enum HeaderMode {
    case feed
    case notifications
    case messages
    case chat(userName: String,
              userImage: String,
              isOnline: Bool,
              lastTimeOnline: Int?,
              timeUnit: String?)
}

import SwiftUI

struct HeaderView: View {
    @State var mode: HeaderMode
    @State var geometry: GeometryProxy
    @Binding var navigationPath: [NavigationDestination]
    
    var body: some View {
        switch mode {
        case .feed:
            HStack {
                Button {
                    print("BrandButton pressed")
                } label: {
                    HStack {
                        Text("SocialMedia")
                    }
                }
                
                Spacer()

                Button {
                    print("NotificationsButton pressed")
                    navigationPath.append(.notifications)
                } label: {
                    Image(systemName: "heart")
                }

                Button {
                    print("MessagesButton pressed")
                    navigationPath.append(.messages)
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .bold()
            .frame(maxWidth: .infinity)
        case .notifications:
            HStack {
                Button {
                    print("BackButton pressed")
                    if !navigationPath.isEmpty {
                        navigationPath.removeLast()
                    }
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                    }
                }
                
                Button {
                    print("AccountButton pressed")
                } label: {
                    HStack {
                        Text("funnyCats")
                        
                        Image(systemName: "chevron.down")
                    }
                }
                
                Spacer()
            }
            .bold()
            .frame(maxWidth: .infinity)
        case .messages:
            HStack {
                HStack {
                    Button {
                        print("BackButton pressed")
                        if !navigationPath.isEmpty {
                            navigationPath.removeLast()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                        }
                    }
                    
                    Button {
                        print("AccountButton pressed")
                    } label: {
                        HStack {
                            Text("funnyCats")
                            
                            Image(systemName: "chevron.down")
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    Button {
                        print("AIChatButton pressed")
                    } label: {
                        HStack {
                            Image(systemName: "star") // TODO: Change
                        }
                    }
                    
                    Button {
                        print("NewChatButton pressed")
                    } label: {
                        HStack {
                            Image(systemName: "square.and.pencil") // TODO: Change
                        }
                    }
                }
            }
            .bold()
            .frame(maxWidth: .infinity)
        case .chat(let userName,
                   let userImage,
                   let isOnline,
                   let lastTimeOnline,
                   let timeUnit):
            HStack {
                Button {
                    print("BackButton pressed")
                    if !navigationPath.isEmpty {
                        navigationPath.removeLast()
                    }
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .bold()
                    }
                }
                
                HStack {
                    Button {
                        print("ProfileImageButton pressed")
                    } label: {
                        Image(userImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: geometry.size.width * 0.1 - 6,
                                height: geometry.size.width * 0.1 - 6
                            )
                            .clipShape(Circle())
                    }
                    
                    Button {
                        print("ChatConfigurationButton pressed")
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(userName)
                                    .bold()
                                
                                Image(systemName: "chevron.right")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                            
                            HStack {
                                Text("Online há ")
                                + Text("\(lastTimeOnline!)") // TODO: Remove force
                                + Text("\(timeUnit!)") // TODO: Remove force
                            }
                            .foregroundStyle(.gray)
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    print("BlendButtonPressed")
                } label: {
                    Image(systemName: "balloon.2") // TODO: Change
                        .bold()
                }
                
                Button {
                    print("VoiceCallButton pressed")
                } label: {
                    Image(systemName: "phone")
                        .bold()
                }
                
                Button {
                    print("VideoCallButton pressed")
                } label: {
                    Image(systemName: "video") // TODO: Change
                        .bold()
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview("Header for FeedView") {
    GeometryReader { geometry in
        HeaderView(mode: .feed, geometry: geometry, navigationPath: .constant([]))
    }
}

#Preview("Header for NotificationsView") {
    GeometryReader { geometry in
        HeaderView(mode: .notifications, geometry: geometry, navigationPath: .constant([]))
    }
}

#Preview("Header for MessagesView") {
    GeometryReader { geometry in
        HeaderView(mode: .messages, geometry: geometry, navigationPath: .constant([]))
    }
}

#Preview("Header for ChatView") {
    GeometryReader { geometry in
        HeaderView(mode: .chat(userName: "funnyCats",
                               userImage: "catPhoto",
                               isOnline: false,
                               lastTimeOnline: 1,
                               timeUnit: "h"),
                   geometry: geometry,
                   navigationPath: .constant([]))
    }
}
