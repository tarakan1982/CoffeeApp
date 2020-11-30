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
                var scoreDim = selection + 10
                Text("\(scoreDim)")
            } else {
                Image(systemName: "cart")
                var scoreDim = selection + 30
                Text("\(scoreDim)")
            }
        Picker(selection: $selection, label: Text("Просто счетчик")) {
                    ForEach(0 ..< 5) {
                        Text("Число \($0)") }
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

