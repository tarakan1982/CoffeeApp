//
//  Preferences.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI
//import Combine

//
//struct srtuctCoffe {
//
//    var numberOfCoffee : Int
//    var sizeCoffee : Int
//    var sugarCount : Int
//    var addit  : Int
//    var price : Int
//
//}


//class valueCoffe: ObservableObject {
//    var value = [srtuctCoffe]()
//}

struct Preferences: View {
    
    var objectCoffee: MenuCoffee

//    @ObservedObject var valueCoffePreferences = valueCoffe()
    
    @State var sizeOfCoffeeDim = 0
    @State var countSugarDim = 3
    @State var countAdditDim = 7
    
///////////////////////////////////////////////////////////////////////////////////////
    @State var numberOfCoffee = 1
    @State var sizeCoffee = 0
    @State var sugarCount = 0
    @State var addit = 0
    @State var price = totalPrice.self
//////////////////////////////////////////////////////////////////////////////////////////
    
    
    func totalPrice() -> Int {
        let price = (sizeCoffee + sugarCount + addit) * numberOfCoffee
    return price
    }
        
    @State var showAlertMessage = false
    
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
                    Text("\(objectCoffee.nameCoffee) \(objectCoffee.price)р.")
                        .bold()
                    Spacer()
                    Text("\(numberOfCoffee) шт.")
                }
                .font(.system(size: 32))
                HStack {
                    Stepper("Количество", value: $numberOfCoffee, in: 0...100)
                    
                }
                .frame(height: 50)
                Divider()
                    .frame(height: 2)
                    .background((Color("fontcolor")))
                HStack() {
                    Text("Размер: ")
                    Spacer()
                    VStack(alignment: .trailing) {
                        if sizeOfCoffeeDim == 0 {
                            Text("Малый")
                        } else if sizeOfCoffeeDim == 1 {
                            Text("Средний")
                        } else {
                            Text("Большой")
                        }
                        Picker(selection: $sizeOfCoffeeDim, label: Text("Выбор размера")) {
                            
                            
                            Image("size04").tag(0)
                            Image("size05").tag(1)
                            Image("size06").tag(2)
                            
                        }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: sizeOfCoffeeDim) { _ in
                            if sizeOfCoffeeDim == 0 {
                                sizeCoffee = objectCoffee.price
                            } else if sizeOfCoffeeDim == 1 {
                                sizeCoffee = objectCoffee.price + 20
                            } else {
                                sizeCoffee = objectCoffee.price + 40
                            }
                        }
                        .frame(width: 150)
                    }
                    
                }
                .frame(height: 50)
                Divider()
                    .frame(height: 2)
                    .background((Color("fontcolor")))
                HStack() {
                    Text("Сахар: ")
                    Spacer()
                    VStack(alignment: .trailing) {
                        if countSugarDim == 3 {
                            Text("Без сахара")
                        } else if countSugarDim == 4 {
                            Text("Одна порция")
                        } else if countSugarDim == 5 {
                            Text("Две порции")
                        } else {
                            Text("Три порции")
                        }
                        Picker(selection: $countSugarDim, label: Text("Количество сахара")) {
                            Image("sugar05").tag(3)
                            Image("sugar06").tag(4)
                            Image("sugar07").tag(5)
                            Image("sugar08").tag(6)
                        }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: countSugarDim) { _ in
                            if countSugarDim == 3 {
                                sugarCount = 0
                            } else if countSugarDim == 4 {
                                sugarCount = 10
                            } else if countSugarDim == 5 {
                                sugarCount = 20
                            } else {
                                sugarCount = 30
                            }
                        }
                        .frame(width: 200)
                    }
                    
                }
                .frame(height: 50)
                Divider()
                    .frame(height: 2)
                    .background((Color("fontcolor")))
                HStack() {
                    Text("Сливки: ")
                    Spacer()
                    VStack(alignment: .trailing) {
                        if countAdditDim == 7 {
                            Text("Со сливками")
                        } else {
                            Text("Сливки не нужны")
                        }
                        Picker(selection: $countAdditDim, label: Text("Количество сливок")) {
                            Image("addit04").tag(7)
                            Image("addit03").tag(8)
                        }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: countAdditDim) { _ in
                            if countAdditDim == 7 {
                               addit = 0
                            } else {
                                addit = 36
                            }
                        }
                        .frame(width: 100)
                    }
                    
                }
                .frame(height: 50)
                Divider()
                    .frame(height: 2)
                    .background((Color("fontcolor")))
                HStack(alignment: .bottom) {
                    Text("Итого: ")
                        .font(.system(size: 32)).bold().italic()
                    Spacer()
                    Text("\(totalPrice())р")
                        .font(.system(size: 32)).bold().italic()
                }
                
            }
            
            .foregroundColor(Color("menufont"))
            .font(.system(size: 20))
            .padding(.horizontal)
            NavigationLink(
                destination: OrdersCart(nameOfCoffeeOrder: objectCoffee.nameCoffee, quantityOrder: numberOfCoffee, sizeOrder: sizeCoffee, sugarOrder: sugarCount, slivkoOrder: addit, totalPriceOrder: totalPrice()),
                label: {
                    Text("Заказать")
                        .foregroundColor(.white)
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding()
                })
                .navigationBarTitle("\(objectCoffee.nameCoffee)")
                .background(Color("buttoncolor"))
                            .cornerRadius(30)
                            .padding(.top, 16)
//            Button(action: {
//                self.showAlertMessage.toggle()
//            }) {
//                Text("В корзину")
//                    .foregroundColor(.white)
//                    .frame(width: UIScreen.main.bounds.width - 80)
//                    .padding()
//            }
//            .background(Color("buttoncolor"))
//            .cornerRadius(30)
//            .padding(.top, 16)
//            .alert(isPresented: self.$showAlertMessage) {
//                Alert(title: Text("ТОВАРИЩ!"), message: Text("А теперь самое интересное: просьба закрыть окно, сделать скриншот и отправить на почту dhfkjsd@gmail.com. Не факт что и это дойдет, поэтому лучше звоните по телефону +77987239234, может ответим"), primaryButton: .default (Text("OK")),
//                      secondaryButton: .cancel())
//            }
            Spacer()
            
        }
        
    }
}



struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences(objectCoffee: coffeeData[1])
    }
}
