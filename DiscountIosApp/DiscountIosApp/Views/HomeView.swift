//
//  HomeView.swift
//  DiscountIosApp
//
//  Created by Gonzalo Olvera Monroy on 14/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var price: String = ""
    @State private var discount: String = ""
    
    var body: some View {
        VStack {
            
            TwoCardComponent(title1: "Price", number1: 0.12, title2: "Discount", number2: 10.31)
            
            MainTextField(value: $price, label: "Price")
                .padding(.horizontal, 30)
            
            MainTextField(value: $discount, label: "Discount")
                .padding(.horizontal, 30)
            
            MainButton()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
