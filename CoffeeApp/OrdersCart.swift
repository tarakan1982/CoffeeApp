//
//  OrdersCart.swift
//  CoffeeApp
//
//  Created by Дмитрий on 03.11.2020.
//

import SwiftUI

struct OrdersCart: View {
    
    @Environment(\.presentationMode) var presentation // добавили для того,чтобы кнопка назад в меню заработала
    var nameOfCoffeeOrder: String = ""
    var quantityOrder: Int = 0
    var sizeOrder: Int = 0
    var sugarOrder: Int = 0
    var slivkoOrder: Int = 0
    var totalPriceOrder: Int = 0
    
    var body: some View {
        VStack {
            Text("Вы заказали: \(nameOfCoffeeOrder) в количестве: \(quantityOrder) штук")
            Text("Размер кофе: \(sizeOrder), количество сахара: \(sugarOrder)")
            Text("Сливки: \(slivkoOrder)")
            Text("Общая стоимость заказа составляет: \(totalPriceOrder)")
            Button("Назад в меню") {
                self.presentation.wrappedValue.dismiss()
            }
        }
        .navigationBarBackButtonHidden(true) //Скрыли кнопку назад в меню
    }
    }


struct OrdersCart_Previews: PreviewProvider {
    static var previews: some View {
        OrdersCart()
    }
}
