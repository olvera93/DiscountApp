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
    @State private var isButtonPressed: Bool = false
    @State var priceDiscount: Double = 0.0
    @State var totalDiscount : Double = 0.0
    
    var body: some View {
        ZStack{
            
            VStack {
                
                TwoCardComponent(title1: "Price", number1: totalDiscount, title2: "Discount", number2: priceDiscount)
                
                MainTextField(value: $price, label: "Price")
                MainTextField(value: $discount, label: "Discount")
                MainButton( isButtonPressed: $isButtonPressed, title: "Generator Discount", backgroundColor: Color.blue) {
                    if price != "" && discount != "" {
                        priceDiscount = calculatePrice(price: Double(price) ?? 0.0, discount: Double(discount) ?? 0.0)
                        totalDiscount = calculateDiscount(price: Double(price) ?? 0.0, discount: Double(discount) ?? 0.0)
                    }
                    
                }
                MainButton( isButtonPressed: $isButtonPressed, title: "Clean", backgroundColor: Color.red) {
                    price = ""
                    discount = ""
                    priceDiscount = 0.0
                    totalDiscount = 0.0
                    
                }
                
                Spacer(minLength: 10)
            }
        }.padding(.horizontal, 30)
        
    }
    
    func calculatePrice(price: Double, discount: Double) -> Double {
        let res = price - calculateDiscount(price: price, discount: discount)
        return round(res * 100) / 100.0
    }
    
    func calculateDiscount(price: Double, discount: Double) -> Double {
        let res = price * (1 - discount / 100)
        return round(res * 100) / 100.0
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
