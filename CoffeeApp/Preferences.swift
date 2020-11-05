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
        VStack{
        VStack(alignment: .leading) {
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
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
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
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
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
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
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
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
                HStack(alignment: .bottom) {
                    Text("Итого: ")
                        .font(.system(size: 32)).bold().italic()
                    Spacer()
                    Text("\((sizeCoffee + sugarCount + addit) * numberOfCoffee)")
                        .font(.system(size: 32)).bold().italic()
                        .animation(.easeInOut)
                }
                
                
            }
            
            .foregroundColor(Color("menufont"))
            .font(.system(size: 20))
                .padding(.horizontal)
            
                            
        }
        Button(action: {
            
        }) {
            Text("В корзину")
                .padding(15)
                .padding(.horizontal, 134) //надо посмотреть как сделать так, чтобы кнопка ресайзилась от края до края. просто ставить тут большую цифру нет смысла, на мелких экранах вылезет за края. Заключать во фрейм с шириной инфинити не прокатило, жаль.
                .background(Color("buttoncolor"))
                .cornerRadius(30)
                .padding(.horizontal)
                .padding(.top, 30)
                .foregroundColor(.white)
        }
        
        
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
