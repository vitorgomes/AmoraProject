//
//  MessagesView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct MessagesView: View {
    @State private var searchText: String = ""
    @Binding var navigationPath: [NavigationDestination]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(mode: .messages,
                           geometry: geometry,
                           navigationPath: $navigationPath)
                    .padding(.bottom, 16)
                    .padding(.horizontal, 8)
                
                ScrollView {
                    
                    AITextField(text: $searchText)
                        .padding(.horizontal, 8)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .bottom) {
                            NoteView(geometry: geometry)
                                .padding(.top, 10)
                            
                            OnlinePhotoView(geometry: geometry)
                            
                            OnlinePhotoView(geometry: geometry)
                            
                            OnlinePhotoView(geometry: geometry)
                        }
                    }
                    .frame(height: geometry.size.height * 0.2)
                    .padding(.leading, 8)
                    
                    HStack {
                        Text("Mensagens")
                        
                        Spacer()
                        
                        Text("Pedidos")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                    }
                    .bold()
                    .padding([.horizontal, .vertical], 16)
                    
                    VStack {
                        Button {
                            navigationPath.append(.chat(
                                userName: "funnyCats",
                                userImage: "catPhoto",
                                isOnline: false,
                                lastTimeOnline: 1,
                                timeUnit: "h"
                            ))
                        } label: {
                            MessagePreviewView(geometry: geometry,
                                               isOnline: false,
                                               sizeMultiplier: 0.15)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button {
                            navigationPath.append(.chat(
                                userName: "funnyCats",
                                userImage: "catPhoto",
                                isOnline: false,
                                lastTimeOnline: 2,
                                timeUnit: "h"
                            ))
                        } label: {
                            MessagePreviewView(geometry: geometry,
                                               isOnline: false,
                                               sizeMultiplier: 0.15)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button {
                            navigationPath.append(.chat(
                                userName: "funnyCats",
                                userImage: "catPhoto",
                                isOnline: true,
                                lastTimeOnline: nil,
                                timeUnit: nil
                            ))
                        } label: {
                            MessagePreviewView(geometry: geometry,
                                               isOnline: false,
                                               sizeMultiplier: 0.15)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button {
                            navigationPath.append(.chat(
                                userName: "funnyCats",
                                userImage: "catPhoto",
                                isOnline: false,
                                lastTimeOnline: 3,
                                timeUnit: "d"
                            ))
                        } label: {
                            MessagePreviewView(geometry: geometry,
                                               isOnline: false,
                                               sizeMultiplier: 0.15)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 8)
                }
            }
        }
    }
    
    private struct AITextField: View {
        @Binding var text: String
        
        var body: some View {
            HStack(spacing: 12) {
                // AI Icon
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.cyan, .blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Circle()
                        .fill(.textFieldBackground)
                        .frame(width: 14, height: 14)
                }
                .frame(width: 24, height: 24)
                
                // TextField
                TextField("Interaja com AI ou pesquise", text: $text)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .tint(.cyan)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(.textFieldBackground)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
        }
    }
}

#Preview {
    MessagesView(navigationPath: .constant([]))
}
