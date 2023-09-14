//
//  HomeView.swift
//  DiscountIosApp
//
//  Created by Gonzalo Olvera Monroy on 14/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var value: String = ""
    
    var body: some View {
        VStack {
            MainTextField(value: $value, label: "Price")
                .padding(.horizontal, 30)
            MainTextField(value: $value, label: "Discount")
                .padding(.horizontal, 30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
