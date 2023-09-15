//
//  CardComponent.swift
//  DiscountIosApp
//
//  Created by Gonzalo Olvera Monroy on 15/09/23.
//

import SwiftUI
import SwiftUIX

struct CardComponent: View {
    
    var title: String
    var number: Double
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.lightGray)
            .frame(width: 150, height: 100)
            .overlay(
                VStack(alignment: .center) {
                    Text(title)
                        .font(.system(size: 30))
                        .padding(.top, 10)
                    
                    Text("$\(number)")
                        .font(.system(size: 20))
                }
                    .padding(10)
            )
    }
}

struct TwoCardComponent: View {
    
    var title1: String
    var number1: Double
    var title2: String
    var number2: Double
    
    var body: some View {
        
        HStack(alignment: .center) {
            CardComponent(title: title1, number: number1)
                .padding(.leading, 30)
            CardComponent(title: title2, number: number2)
                .padding(.trailing, 30)
        }
    }
}


struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        TwoCardComponent(title1: "Total", number1: 10.3, title2: "Discount", number2: 10.465)
    }
}
