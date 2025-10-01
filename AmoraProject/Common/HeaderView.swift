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
}

import SwiftUI

struct HeaderView: View {
    @State var mode: HeaderMode
    
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
                } label: {
                    Image(systemName: "heart")
                }

                Button {
                    print("MessagesButton pressed")
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
        }
    }
}

#Preview("Header for FeedView") {
    HeaderView(mode: .feed)
}

#Preview("Header for NotificationsView") {
    HeaderView(mode: .notifications)
}

#Preview("Header for MessagesView") {
    HeaderView(mode: .messages)
}
