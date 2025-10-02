//
//  SingleBubbleMessageReceivedView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct SingleBubbleMessageReceivedView: View {
    let text: String
    @State var geometry: GeometryProxy
    
    var body: some View {
        Text(text)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.textFieldBackground)
            )
            .frame(maxWidth: geometry.size.width * 0.7, alignment: .leading)
    }
}

#Preview {
    GeometryReader { geometry in
        SingleBubbleMessageReceivedView(text: "test", geometry: geometry)
    }
}
