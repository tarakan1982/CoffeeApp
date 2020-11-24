//
//  DeleteMe.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 25.11.2020.
//

import SwiftUI

struct DeleteMe: View {

    private var options = ["add", "edit", "delete"]
    @State private var selectedOption = 0
    @State private var choosed = 0

    var body: some View {

        VStack {

            Picker(selection: $selectedOption.onChange(changeViewWithThirdWay), label: Text("Choose action")) {
                ForEach(0 ..< self.options.count) {
                    Text(self.options[$0]).tag($0)
                }
            }.pickerStyle(SegmentedPickerStyle())

            // MARK: first way
            VStack {
                if selectedOption == 0 {
                    Text("add (first way)")
                } else if selectedOption == 1 {
                    Text("edit (first way)")
                } else {
                    Text("delete (first way)")
                }

                Divider()

                // MARK: second way
                ZStack {

                    Text("One")
                        .opacity(selectedOption == 0 ? 1 : 0)

                    Text("Two")
                        .opacity(selectedOption == 1 ? 1 : 0)

                    Text("Four")
                        .opacity(selectedOption == 2 ? 1 : 0)
                }

                Divider()

                // MARK: showing third way
                Text("just to show, how to use third way: \(self.choosed)")

                Spacer()

            }

        }

    }

    func changeViewWithThirdWay(_ newValue: Int) {
        print("will change something in third way with: \(choosed), you can do everything in this function")
        withAnimation {
            choosed = newValue
        }

    }

}

// MARK: the third way
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}

struct DeleteMe_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMe()
    }
}
