//
//  GroupedLikeNotification.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

import SwiftUI

struct GroupedLikeNotification: View {
    @State var geometry: GeometryProxy
    
    var body: some View {
        HStack {
            ZStack(alignment: .topLeading) {
                Image("catPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width * 0.1 - 6,
                        height: geometry.size.width * 0.1 - 6
                    )
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(.white, lineWidth: 2)
                    }

                Image("catPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width * 0.1 - 6,
                        height: geometry.size.width * 0.1 - 6
                    )
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(.white, lineWidth: 2)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        ZStack {
                            Circle()
                                .fill(.red)
                                .frame(width: 20, height: 20)
                            
                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .frame(width: 20, height: 20)
                            
                            Image(systemName: "heart.fill")
                                .font(.system(size: 8, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .offset(x: 5, y: 5)
                    }
                    .offset(x: 15, y: 15)
            }
            .padding(.trailing, 16)
            
            HStack {
                Text("**Fulano**, **Cicrano** e outras 10 pessoas curtiram a sua foto.")

                + Text(" 1 sem")
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Image("catPhoto")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: geometry.size.width * 0.1 - 6,
                    height: geometry.size.width * 0.1 - 6
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    GeometryReader { geometry in
        GroupedLikeNotification(geometry: geometry)
    }
}
