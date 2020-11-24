//
//  DeleteView.swift
//  CoffeeApp
//
//  Created by Дмитрий on 24.11.2020.
//

import SwiftUI
struct DeleteView: View {
    @State var sizeOfCoffeeDim = 0
    var coffeeSizesDim = [
        Image.sizeSmall,
        Image.sizeMedium,
        Image.sizeLarge
    ]
    
    var body: some View {
        Picker(selection: $sizeOfCoffeeDim, label: Text("Выбор размера")) {
            coffeeSizesDim[0].tag(0)
            coffeeSizesDim[1].tag(1)
            coffeeSizesDim[2].tag(2)
        }.pickerStyle(SegmentedPickerStyle())
        .frame(width: 200)
        
    }
}

extension Image {
    static var sizeSmall: Image {
        Image("size01")
    }

    static var sizeMedium: Image {
        Image("size02")
    }
    static var sizeLarge: Image {
        Image("size03")
    }
}


struct DeleteView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteView()
    }
}

