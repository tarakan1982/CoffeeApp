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
            OrdersCart()
                .tabItem {
                Image(systemName: "cart")
                    Text("Корзина")
                }.tag(2)
            MapViewPage()
                .tabItem {
                Image(systemName: "map")
                    Text("Карта")
                }.tag(3)
            MyDataPage()
//                DeleteMe()
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
