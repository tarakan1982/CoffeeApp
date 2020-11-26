//
//  DeleteMe.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 25.11.2020.
//

import SwiftUI

struct DeleteMe: View {
    @State private var selection = 0
    var body: some View {
        VStack {
            Text("\(selection)")
            if selection == 1 {
                Text("Hello")
            } else {
                Image(systemName: "cart")
            }
        Picker(selection: $selection, label: Text("Some Label")) {
                    ForEach(0 ..< 5) {
                        Text("Number \($0)") }
                }.onChange(of: selection) { _ in
                    print(selection)
                }
        }
    }
     }

struct DeleteMe_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMe()
    }
}
