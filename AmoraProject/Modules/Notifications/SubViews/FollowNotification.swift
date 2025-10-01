//
//  FollowNotification.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

import SwiftUI

struct FollowNotification: View {
    @State var geometry: GeometryProxy
    
    var body: some View {
        HStack {
            Image("catPhoto")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: geometry.size.width * 0.1 - 6,
                    height: geometry.size.width * 0.1 - 6
                )
                .clipShape(Circle())
            
            HStack {
                Text("**Fulano** começou a seguir você.")

                + Text(" 1 sem")
                    .foregroundStyle(.gray)
            }
            .lineLimit(4)
            
            Spacer()
            
            Button {
                print("FollowButton pressed")
            } label: {
                Text("Seguir de volta")
                    .foregroundStyle(.white)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.followButton)
                            .frame(width: 150, height: 30)
                    )
            }
            .padding(.trailing)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GeometryReader { geometry in
        FollowNotification(geometry: geometry)
    }
}
