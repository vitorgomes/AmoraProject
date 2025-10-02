//
//  FeedView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(mode: .feed, geometry: geometry)
                    .padding(.horizontal, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        Button {
                            print("PostStoryButton pressed")
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.clear)
                                        .frame(
                                            width: geometry.size.width * 0.2,
                                            height: geometry.size.width * 0.2
                                        )

                                    Image("catPhoto")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(
                                            width: geometry.size.width * 0.2 - 6,
                                            height: geometry.size.width * 0.2 - 6
                                        )
                                        .clipShape(Circle())
                                        .overlay(alignment: .bottomTrailing) {
                                                    ZStack {
                                                        Circle()
                                                            .fill(.black)
                                                            .frame(width: 30, height: 30)
                                                        
                                                        Circle()
                                                            .strokeBorder(.white, lineWidth: 3)
                                                            .frame(width: 30, height: 30)
                                                        
                                                        Image(systemName: "plus")
                                                            .font(.system(size: 16, weight: .semibold))
                                                            .foregroundColor(.white)
                                                    }
                                                    .offset(x: 4, y: 4)
                                                }
                                }
                                
                                Text("Seu Story")
                            }
                        }
                        
                        VStack {
                            ReelsButton(photo: "catPhoto",
                                        geometry: geometry,
                                        sizeMultiplier: 0.2)
                            
                            Text("funnyCats")
                        }
                        
                        VStack {
                            ReelsButton(photo: "catPhoto",
                                        geometry: geometry,
                                        sizeMultiplier: 0.2)
                            
                            Text("funnyCats")
                        }
                        
                        VStack {
                            ReelsButton(photo: "catPhoto",
                                        geometry: geometry,
                                        sizeMultiplier: 0.2)
                            
                            Text("funnyCats")
                        }
                        
                        VStack {
                            ReelsButton(photo: "catPhoto",
                                        geometry: geometry,
                                        sizeMultiplier: 0.2)
                            
                            Text("funnyCats")
                        }
                    }
                }
                .frame(height: 120)
                .padding(.leading, 8)
                
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        PostPhotoView(geometry: geometry)
                            .frame(height: geometry.size.height * 0.6)
                        
                        PostPhotoView(geometry: geometry)
                            .frame(height: geometry.size.height * 0.6)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    FeedView()
}
