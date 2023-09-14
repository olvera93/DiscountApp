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
        ZStack(alignment: .leading) {
            
            
            TextField(label, text: $value)
                .padding(.horizontal, 8)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

