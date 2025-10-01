//
//  NoteView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct NoteView: View {
    @State var geometry: GeometryProxy
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Image("catPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width * 0.2 - 6,
                        height: geometry.size.width * 0.2 - 6
                    )
                    .clipShape(Circle())
                    .padding(.top, 50)

                BalloonView(text: "Nota")
                    .offset(y: -5)
            }
            
            Text("Sua nota")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
    }
    
    private struct BalloonView: View {
        let text: String
        
        var body: some View {
            VStack(spacing: 0) {
                // Ballon body
                Text(text)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 26)
                            .fill(.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                
                // Ballon tail
                ZStack(alignment: .topLeading) {
                    // Semi circle
                    SemiCircle()
                        .fill(.white)
                        .frame(width: 24, height: 24)
                        .offset(x: -12, y: -3)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                    
                    // Small circle
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                        .offset(x: 2, y: 12)
                }
                .frame(height: 20)
            }
        }
    }
    
    private struct SemiCircle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.width / 2,
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: false
            )
            path.closeSubpath()
            
            return path
        }
    }
}


#Preview {
    GeometryReader { geometry in
        NoteView(geometry: geometry)
    }
}
