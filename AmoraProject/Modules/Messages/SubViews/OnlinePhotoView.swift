//
//  OnlinePhotoView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct OnlinePhotoView: View {
    @State var geometry: GeometryProxy
    
    var body: some View {
        VStack {
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
                            .fill(.green)
                            .frame(width: 20, height: 20)
                        
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                            .frame(width: 20, height: 20)
                    }
                    .offset(x: -4, y: 4)
                }
            
            Text("gatinhaa")
        }
    }
}

#Preview {
    GeometryReader { geometry in
        OnlinePhotoView(geometry: geometry)
    }
}
