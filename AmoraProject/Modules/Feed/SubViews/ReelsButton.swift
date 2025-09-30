//
//  ReelsButton.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 30/09/25.
//

import SwiftUI

struct ReelsButton: View {
    @State var photo: String
    @State var geometry: GeometryProxy
    @State var sizeMultiplier: CGFloat
    
    var body: some View {
        Button {
            print("ReelsButton pressed")
        } label: {
            ZStack {
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color(red: 1.0, green: 0.3, blue: 0.5),
                                Color(red: 1.0, green: 0.5, blue: 0.2)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 3
                    )
                    .frame(
                        width: geometry.size.width * sizeMultiplier,
                        height: geometry.size.width * sizeMultiplier
                    )

                Image(photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width * sizeMultiplier - 6,
                        height: geometry.size.width * sizeMultiplier - 6
                    )
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    GeometryReader { geometry in
        ReelsButton(photo: "catPhoto",
                    geometry: geometry,
                    sizeMultiplier: 0.2)
    }
}
