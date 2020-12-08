//
//  MainMenu.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationView() {
            List(coffeeData) { menuCoffee in
                ScrollView() {
                    //NavigationLink(destination: Text(menuCoffee.nameCoffee)) этот навигейшн работает,  передает название напитка на следующий вью
                    NavigationLink(destination: Preferences(objectCoffee: menuCoffee)) {
                        HStack {
                            Image(menuCoffee.image)
                                .frame(width: 70, height: 104, alignment: .leading)
                            Text(menuCoffee.nameCoffee)
                                .foregroundColor(Color("menufont"))
                                .font(.system(size: 20))
                            Spacer()
                            Text(">")
                                .foregroundColor(Color("menufont"))
                                .font(.system(size: 20))
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitle("Меню", displayMode: .inline) //тоже как изменить размер и цвет остается для меня загадкой
        }
    }
}

struct MenuCoffee: Identifiable {
    var id = UUID()
    var image: String
    var nameCoffee: String
    var price : Int
}

let coffeeData: [MenuCoffee] = [
    MenuCoffee(image: "espresso", nameCoffee: "Espresso", price: 45 ),
    MenuCoffee(image: "cappuccino", nameCoffee: "Cappuccino", price: 34),
    MenuCoffee(image: "macciato", nameCoffee: "Macciato", price: 67),
    MenuCoffee(image: "mocha", nameCoffee: "Mocha", price: 86),
    MenuCoffee(image: "latte", nameCoffee: "Latte", price: 50)
]


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
