//
//  SingleBubbleMessageSentView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct SingleBubbleMessageSentView: View {
    let text: String
    @State var geometry: GeometryProxy
    
    var body: some View {
        Text(text)
            .padding(8)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.purple)
            )
            .frame(maxWidth: geometry.size.width * 0.7, alignment: .trailing)
    }
}

#Preview {
    GeometryReader { geometry in
        SingleBubbleMessageSentView(text: "Test", geometry: geometry)
    }
}
