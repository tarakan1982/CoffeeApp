//
//  TabViewBottom.swift
//  CoffeeApp
//
//  Created by Дмитрий on 29.10.2020.
//

import SwiftUI

struct TabViewBottom: View {
    var body: some View {
        TabView() {
            Text("Первая страница").tabItem {
                VStack {
                Image(systemName: "house")
                    Text("Главная")
                }
                }.tag(1)
            Text("Вторая страница").tabItem {
                VStack {
                Image(systemName: "map")
                    Text("Карта")
                }
                }.tag(2)
            Text("Третья страница").tabItem {
                VStack {
                Image(systemName: "tornado")
                    Text("Кофе")
                }
                }.tag(3)
            Text("Четвертая страница").tabItem {
                VStack {
                Image(systemName: "person")
                    Text("Мои данные")
                }
                }.tag(4)


        }
        .ignoresSafeArea()
    }
}

struct TabViewBottom_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBottom()
    }
}
