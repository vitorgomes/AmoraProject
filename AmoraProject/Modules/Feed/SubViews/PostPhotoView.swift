//
//  PostPhotoView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

import SwiftUI

struct PostPhotoView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    ReelsButton(photo: "catPhoto",
                                geometry: geometry,
                                sizeMultiplier: 0.1)
                    
                    Button {
                        print("NameButton pressed")
                    } label: {
                        Text("funnyCats")
                            .bold()
                    }
                    
                    Spacer()
                    
                    Button {
                        print("MoreButton pressed")
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
                .padding([.horizontal, .top], 8)
                
                Image("catPhoto")
                    .resizable()
                    .scaledToFit()

                HStack {
                    Button {
                        print("LikeButton pressed")
                    } label: {
                        Image(systemName: "heart")
                            .bold()
                    }
                    
                    Button {
                        print("CommentsButton pressed")
                    } label: {
                        Image(systemName: "message") // change
                            .bold()
                    }
                    
                    Text("100")
                        .bold()
                    
                    Button {
                        print("RepostButton pressed")
                    } label: {
                        Image(systemName: "arrow.clockwise") // change
                            .bold()
                    }

                    Text("23")
                        .bold()
                    
                    Button {
                        print("SendButton pressed")
                    } label: {
                        Image(systemName: "paperplane")
                            .bold()
                    }
                    
                    Spacer()
                    
                    Button {
                        print("SaveButton pressed")
                    } label: {
                        Image(systemName: "bookmark")
                            .bold()
                    }
                }
                .padding(.horizontal, 8)
                
                HStack {
                    Text("Curtido por")
                    
                    Button {
                        print("LikedNameButton pressed")
                    } label: {
                        Text("gatinhaaa")
                            .bold()
                    }
                    
                    Text("e")
                    
                    Button {
                        print("OtherLikedNameButton pressed")
                    } label: {
                        Text("outras pessoas")
                            .bold()
                    }
                }
                .padding(.horizontal, 8)
                
                HStack {
                    Button {
                        print("NamePostButton pressed")
                    } label: {
                        Text("funnyCats")
                            .bold()
                    }
                    Text("Estou muito gatinho hoje 😸")
                }
                .padding(.horizontal, 8)
                
                Text("Há 5 minutos")
                    .foregroundStyle(.gray)
                    .padding(.leading, 8)
            }
        }
    }
}

#Preview {
    PostPhotoView()
}
