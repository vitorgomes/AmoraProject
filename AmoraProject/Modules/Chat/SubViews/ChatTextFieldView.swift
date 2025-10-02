//
//  ChatTextFieldView.swift
//  AmoraProject
//
//  Created by Vitor Gomes on 01/10/25.
//

import SwiftUI

struct ChatTextFieldView: View {
    @State var message: String = ""
    var body: some View {
        HStack {
            Button {
                print("CameraButton pressed")
            } label: {
                Image(systemName: "camera")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .padding(8)
                    .background(.cameraButton)
                    .clipShape(Circle())
            }

            TextField("Mensagem...", text: $message)
            
            Button {
                print("AudioButton pressed")
            } label: {
                Image(systemName: "microphone")
            }
            
            Button {
                print("PhotoSelectionButton pressed")
            } label: {
                Image(systemName: "photo")
            }
            
            Button {
                print("StickerButton pressed")
            } label: {
                Image(systemName: "square") // TODO: Change
            }
            
            Button {
                print("LocationButton pressed")
            } label: {
                Image(systemName: "plus.circle")
            }
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.textFieldBackground)
        )
    }
}

#Preview {
    ChatTextFieldView()
}
