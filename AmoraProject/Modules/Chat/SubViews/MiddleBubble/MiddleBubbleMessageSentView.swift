//
//  MiddleBubbleMessageSentView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct MiddleBubbleMessageSentView: View {
    let text: String
    @State var geometry: GeometryProxy
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .foregroundColor(.white)
            .background(
                MiddleBubbleSentShape()
                    .fill(Color.purple)
            )
            .frame(maxWidth: geometry.size.width * 0.7, alignment: .trailing)
    }
}

struct MiddleBubbleSentShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let cornerRadius: CGFloat = 20
        
        // Superior left corner
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        
        // Superior line
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        
        // Right line (without curve)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Inferior line
        path.addLine(to: CGPoint(x: cornerRadius, y: rect.maxY))
        
        // Inferior roundeded left corner
        path.addArc(
            center: CGPoint(x: cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        // Left line
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        
        // Superior rounded left corner
        path.addArc(
            center: CGPoint(x: cornerRadius, y: cornerRadius),
            radius: cornerRadius,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false
        )
        
        return path
    }
}

#Preview {
    GeometryReader { geometry in
        MiddleBubbleMessageSentView(text: "Test", geometry: geometry)
    }
}
