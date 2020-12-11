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
            ZStack {
            Image("header")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image("odredCoffeePict")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            }
            VStack {
            List {
                HStack {
            Text("\(nameOfCoffeeOrder) - \(quantityOrder) шт")
                Spacer()
                Text("\(totalPriceOrder) p.")
                }
            }
            Divider()
                .frame(height: 2)
                .background((Color("fontcolor")))
            Text("Сумма заказа: \(totalPriceOrder)")
            Spacer()
            }
            .foregroundColor(Color("menufont"))
            .font(.system(size: 20))
            .padding(.horizontal)
            .padding(.top)
         
            HStack(spacing: 30) {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Назад")
                }
                .padding(15)
                .padding(.horizontal, 10)
                .foregroundColor(Color("buttoncolor"))
                .cornerRadius(30)
                .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("buttoncolor"), lineWidth: 2))
                Button(action: {

                }) {
                    Text("Подтвердить")
                }
                .padding(15)
                .padding(.horizontal, 10)
                .background(Color("buttoncolor"))
                .foregroundColor(.white)
                .cornerRadius(30)
            }
            .padding(.bottom)
        }
        
             .navigationBarBackButtonHidden(true) //Скрыли кнопку назад в меню
    }
    }


struct OrdersCart_Previews: PreviewProvider {
    static var previews: some View {
        OrdersCart()
    }
}
