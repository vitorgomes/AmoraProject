//
//  SingleLikeNotification.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

import SwiftUI

struct SingleLikeNotification: View {
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
            
            HStack(spacing: 8) {
                Text("**Fulano** curtiu sua foto.")
                
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
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GeometryReader { geometry in
        SingleLikeNotification(geometry: geometry)
    }
}
