//
//  TabViewBottom.swift
//  CoffeeApp
//
//  Created by Дмитрий on 29.10.2020.
//

import SwiftUI

struct TabViewBottom: View {
    @State private var selectedView = 1
    var body: some View {
        TabView(selection: $selectedView) {
            MainMenu()
            .tabItem {
                Image(systemName: "house")
                    Text("Главная")
                }.tag(1)
            Text("Вторая страница")
                .tabItem {
                Image(systemName: "cart")
                    Text("Корзина")
                }.tag(2)
            Text("Третья страница")
                .tabItem {
                Image(systemName: "map")
                    Text("Карта")
                }.tag(3)
            Text("Четвертая страница")
                .tabItem {
                Image(systemName: "person")
                    Text("Мои данные")
                }.tag(4)
        }
    }
}




struct TabViewBottom_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBottom()
    }
}
