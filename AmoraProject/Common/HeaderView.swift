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
                        .bold()
                }

                Button {
                    print("MessagesButton pressed")
                } label: {
                    Image(systemName: "paperplane")
                        .bold()
                }
            }
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
            }
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
                            Image(systemName: "star")
                        }
                    }
                    
                    Button {
                        print("NewChatButton pressed")
                    } label: {
                        HStack {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HeaderView(mode: .feed)
}

#Preview {
    HeaderView(mode: .notifications)
}

#Preview {
    HeaderView(mode: .messages)
}
