//
//  Preferences.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI

struct Preferences: View {
    var objectCoffee: MenuCoffee

    @State var numberOfCoffee = 1
    @State var sizeCoffee = 0
    @State var sugarCount = 0
    @State var addit = 0
    
    
    
    var body: some View {
        VStack {
            ZStack {
            Image("header")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(objectCoffee.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            }
            VStack {
                HStack {
                    Text("\(objectCoffee.nameCoffee ) \(objectCoffee.price)р.")
                        .bold()
                    Spacer()
                Text("\(numberOfCoffee) шт.")
                }
                        .font(.system(size: 32))
                HStack {
                    Stepper("Количество", value: $numberOfCoffee, in: 0...100)
                
                }
                .frame(height: 50)
//                Rectangle()
//                    .foregroundColor(Color("fontcolor"))
//                    .frame(width: .infinity, height: 2, alignment: .center)
                Divider()
                    .background((Color("fontcolor")))
                HStack(alignment: .bottom) {
                    Text("Размер: ")
                    Spacer()
                    
                    
                    // теперь это кнопки
                    Button(action: {self.sizeCoffee = objectCoffee.price}, label: {
                        Image("size01")
                    })
                    
                    
                    
                    
                    Button(action: {self.sizeCoffee = objectCoffee.price + 10}, label: {
                        Image("size02")
                    })
                    
                    
                    
                    Button(action: {self.sizeCoffee = objectCoffee.price + 20}, label: {
                        Image("size03")
                    })
                }
                .frame(height: 50)
//                Rectangle()
//                    .foregroundColor(Color("fontcolor"))
//                    .frame(width: .infinity, height: 2, alignment: .center)
                Divider()
                    .background((Color("fontcolor")))
                HStack(alignment: .bottom) {
                    Text("Сахар: ")
                    Spacer()
                    
                    
                    
                    
                    // теперь это кнопки
                    Button(action: {self.sugarCount = 0}, label: {
                        Image("sugar01")
                    })
                    
                    Button(action: {self.sugarCount = 10 }, label: {
                        Image("sugar02")
                    })
                    
                    Button(action: {self.sugarCount = 20 }, label: {
                        Image("sugar03")
                    })
                    
                    
                    Button(action: {self.sugarCount = 30}, label: {
                        Image("sugar04")
                    })
                    
                    
                }
                .frame(height: 50)
//                Rectangle()
//                    .foregroundColor(Color("fontcolor"))
//                    .frame(width: .infinity, height: 2, alignment: .center)
                Divider()
                    .background((Color("fontcolor")))
                HStack(alignment: .bottom) {
                    Text("Сливки: ")
                    Spacer()
                    
                    
                    // теперь это кнопки
                    Button(action: {self.addit = 0}, label: {
                        Image("addit01")
                    })
                    
                    
                    
                    
                    Button(action: {self.addit = 20}, label: {
                        Image("addit02")
                    })
                    
                    
                    
                }
                .frame(height: 50)
//                Rectangle()
//                    .foregroundColor(Color("fontcolor"))
//                    .frame(width: .infinity, height: 2, alignment: .center)
                Divider()
                    .background((Color("fontcolor")))
                HStack(alignment: .bottom) {
                    Text("Итого: ")
                        .font(.system(size: 32)).bold().italic()
                    Spacer()
                    Text("\((sizeCoffee + sugarCount + addit) * numberOfCoffee)").font(.system(size: 32)).bold().italic()
                }
                
                
            }
            
            .foregroundColor(Color("menufont"))
            .font(.system(size: 20))
                .padding(.horizontal)
            Button(action: {
                
            }) {
                Text("В корзину")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .padding()
            }
            
            .background(Color("buttoncolor"))
            .cornerRadius(30)
            .padding(.top, 16)
            Spacer()
                            
        }


    }
}
struct ZakazCoffee: Identifiable {
    var id = UUID()
    var quantity: String
    var sizeCoffee: String
    var sugarCoffee: String
    var additionsCoffee: String
    var totalPrice: String
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences(objectCoffee: coffeeData[1])
    }
}
