//
//  DeleteMe.swift
//  CoffeeApp
//
//  Created by Дмитрий on 03.12.2020.
//

import SwiftUI

struct DeleteMe: View {
    var body: some View {
        Text("Hi")
    }
}

struct TotalLikes: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        HStack {
            Text("Лайки: ")
            Text("\(userSettings.likes)")
        }
    }
}

struct Facebook: View {
    @EnvironmentObject var userSetings: UserSettings
    var body: some View {
        VStack {
            Text("Фейсбук")
            Button("✌🏼") {
                self.userSetings.likes += 1
            }
            TextField("Просто текст", text: self.$userSetings.facebookTextField)
        }
    }
}

struct Twitter: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Text("Твитер")
            Button("✌🏼")
            {
                self.userSettings.likes += 1
            }
            Text(self.userSettings.facebookTextField)
        }
    }
}

struct DeleteMe_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMe()
    }
}
class UserSettings: ObservableObject {
    @Published var likes: Int = 0
    @Published var facebookTextField: String = ""
}
