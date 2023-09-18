//
//  CardComponent.swift
//  DiscountIosApp
//
//  Created by Gonzalo Olvera Monroy on 15/09/23.
//

import SwiftUI
import SwiftUIX

struct CardComponent: View {
    
    let title: String
    var number: Double
    
    var body: some View {
        
        let formattedNumber = String(format: "$%.2f", number)
        
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.lightGray)
            .opacity(0.6)
            .frame(width: 150, height: 100)
            .overlay(
                VStack(alignment: .center) {
                    Text(title)
                        .font(.system(size: 30))
                        .padding(.top, 10)
                    
                    Text(formattedNumber)
                        .font(.system(size: 20))
                }
                    .padding(10)
            )
    }
}

struct TwoCardComponent: View {
    
    let title1: String
    var number1: Double
    let title2: String
    var number2: Double
    
    var body: some View {
        
        HStack {
            CardComponent(title: title1, number: number1)
                
            CardComponent(title: title2, number: number2)
                
        }
    }
}


struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        TwoCardComponent(title1: "Total", number1: 10.3, title2: "Discount", number2: 10.465)
    }
}
