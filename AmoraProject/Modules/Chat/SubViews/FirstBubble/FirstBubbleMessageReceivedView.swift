//
//  FirstBubbleMessageReceivedView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct FirstBubbleMessageReceivedView: View {
    let text: String
    @State var geometry: GeometryProxy
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .foregroundColor(.black)
            .background(
                FirstBubbleReceivedShape()
                    .fill(.balloonMessage)
            )
            .frame(maxWidth: geometry.size.width * 0.7, alignment: .leading)
    }
}

struct FirstBubbleReceivedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let cornerRadius: CGFloat = 20
        let tailSize: CGFloat = 8
        
        // Inferior left corner little curve (tail)
        path.move(to: CGPoint(x: tailSize, y: rect.maxY))
        
        // Inferior left corner little curve
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.maxY - tailSize),
            control: CGPoint(x: 0, y: rect.maxY)
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
        
        // Superior line
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: 0))
        
        // Superior rounded right corner
        path.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: cornerRadius),
            radius: cornerRadius,
            startAngle: .degrees(-90),
            endAngle: .degrees(0),
            clockwise: false
        )
        
        // Right line
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
        
        // Inferior rounded right corner
        path.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        
        // Inferior line
        path.addLine(to: CGPoint(x: tailSize, y: rect.maxY))
        
        return path
    }
}

#Preview {
    GeometryReader { geometry in
        FirstBubbleMessageReceivedView(text: "test", geometry: geometry)
    }
}
