//
//  MessagePreviewView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

//enum MessageType {
//    case sent
//    case received
//    case receivedMultiple
//    case receivedAndVisualized
//    case reaction
//}

struct MessagePreviewView: View {
    @State var geometry: GeometryProxy
    @State var isOnline: Bool
    @State var sizeMultiplier: CGFloat
    
    var body: some View {
        HStack {
            if isOnline {
                Image("catPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width * sizeMultiplier - 6,
                        height: geometry.size.width * sizeMultiplier - 6
                    )
                    .clipShape(Circle())
            } else {
                Image("catPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width * sizeMultiplier - 6,
                        height: geometry.size.width * sizeMultiplier - 6
                    )
                    .clipShape(Circle())
            }
        
            VStack(alignment: .leading) {
                Text("Test da Silva")
                
                Text("Enviado há 10 min")
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            // circle
            
            Image(systemName: "camera") // TODO: Change
                .bold()
        }
    }
}

#Preview {
    GeometryReader { geometry in
        MessagePreviewView(geometry: geometry,
                           isOnline: false,
                           sizeMultiplier: 0.15)
    }
}
