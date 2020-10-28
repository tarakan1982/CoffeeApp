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
                .navigationBarTitle("Меню") //тоже как изменить размер и цвет остается для меня загадкой
        }
    }
}

struct MenuCoffee: Identifiable {
    var id = UUID()
    var image: String
    var nameCoffee: String
}

let coffeeData: [MenuCoffee] = [
MenuCoffee(image: "espresso", nameCoffee: "Espresso"),
    MenuCoffee(image: "cappuccino", nameCoffee: "Cappuccino"),
    MenuCoffee(image: "macciato", nameCoffee: "Macciato"),
    MenuCoffee(image: "mocha", nameCoffee: "Mocha"),
    MenuCoffee(image: "latte", nameCoffee: "Latte")
]


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
