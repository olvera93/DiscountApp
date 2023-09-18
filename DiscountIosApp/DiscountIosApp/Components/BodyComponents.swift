//
//  BodyComponents.swift
//  DiscountIosApp
//
//  Created by Gonzalo Olvera Monroy on 14/09/23.
//

import Foundation
import SwiftUI

struct MainTextField: View {
    @Binding var value: String
    let label: String
    
    var body: some View {
        
        
        TextField(label, text: $value)
            .padding(.horizontal, 8)
        
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct MainButton: View {
    
    @Binding var isButtonPressed: Bool
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            isButtonPressed.toggle()
            action()
        }) {
            Text(title)
                .foregroundColor(backgroundColor) // Color del texto
                .frame(maxWidth: .infinity)
                .padding()
                .border(Color.black, width: 1)
                .background(Color.clear) // Color de fondo personalizado
        }.cornerRadius(4)
        .padding(.horizontal, 30)
    }
}



