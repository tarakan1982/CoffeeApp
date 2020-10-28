//
//  Preferences.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI

struct Preferences: View {
    var objectCoffee: MenuCoffee
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
            Image("header")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(objectCoffee.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            }
            VStack {
                Text(objectCoffee.nameCoffee)
                    .bold()
                    .font(.system(size: 32))
                HStack(alignment: .bottom) {
                    Text("Размер: ")
                    Spacer()
                    Image("size01")
                    Image("size02")
                    Image("size03")
                }
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
                HStack(alignment: .bottom) {
                    Text("Сахар: ")
                    Spacer()
                    Image("sugar01")
                    Image("sugar02")
                    Image("sugar03")
                    Image("sugar04")
                }
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
                HStack(alignment: .bottom) {
                    Text("Сливки: ")
                    Spacer()
                    Image("addit01")
                    Image("addit02")
                }
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
                HStack(alignment: .bottom) {
                    Text("Итого: ")
                        .font(.system(size: 32)).bold().italic()
                    Spacer()
                    Text("420 руб").font(.system(size: 32)).bold().italic()
                }
                
                
            }
            
            .foregroundColor(Color("menufont"))
            .font(.system(size: 20))
                .padding(.horizontal)
            Button(action: {
                
            }) {
                Text("В корзину")
            }
            
            .padding(15)
            .padding(.horizontal, 134) //надо посмотреть как сделать так, чтобы кнопка ресайзилась от края до края. просто ставить тут большую цифру нет смысла, на мелких экранах вылезет за края. Заключать во фрейм с шириной инфинити не прокатило, жаль.
            .background(Color("buttoncolor"))
            .cornerRadius(30)
            .padding(.horizontal)
            .padding(.top, 30)
            .foregroundColor(.white)
            Spacer()
                            
        }
        .edgesIgnoringSafeArea(.all)

    }
}
struct ZakazCoffee: Identifiable {
    var id = UUID()
    var quantity: String
    var sizeCoffee: String
    var sugarCoffee: String
    var additionsCoffee: String
    var totalPrice: String
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences(objectCoffee: coffeeData[1])
    }
}
