//
//  OrdersCart.swift
//  CoffeeApp
//
//  Created by Дмитрий on 03.11.2020.
//

import SwiftUI

struct OrdersCart: View {
    var body: some View {
        NavigationView {
            List() {
                
            }
            .navigationBarTitle("Корзина", displayMode: .inline)
        }
    }
}

struct OrdersCart_Previews: PreviewProvider {
    static var previews: some View {
        OrdersCart()
    }
}
