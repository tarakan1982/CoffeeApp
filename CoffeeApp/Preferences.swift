//
//  Preferences.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI

struct Preferences: View {
    @State var sizeOfCoffeeDim = 0
    @State var countSugarDim = 3
    @State var countAdditDim = 7
    
    //Создавался для Picker но потом я его слегка переделал и это вроде как больше не нужно
//    var coffeeSizesDim = [
//        Image("size04"),
//        Image("size05"),
//        Image("size06")
//    ]
    var objectCoffee: MenuCoffee
@State var showAlertMessage = false
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
                        //Когда делаю через ForEach, то перестают отображаться картинки, но через него делать более правильно, так как пунктов может быть довольно много и менять в разных местах это не с руки, как и прописывать
//                        ForEach(0 ..< self.coffeeSizesDim.count) {
//                            Text(self.coffeeSizesDim[$0]).tag($0)
//                        }
                        Image("size04").tag(0)
                        Image("size05").tag(1)
                          Image("size06").tag(2)
//                        coffeeSizesDim[0].tag(0)
//                        coffeeSizesDim[1].tag(1)
//                        coffeeSizesDim[2].tag(2)
                       
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                    }
                    // На время теста кнопки решил заменить на Picker, может от этого нам станет лучше
//                    Button(action: {self.sizeCoffee = objectCoffee.price}, label: {
//                        Image("size01")
//                    })
//
//
//
//
//                    Button(action: {self.sizeCoffee = objectCoffee.price + 10}, label: {
//                        Image("size02")
//                    })
//
//
//
//                    Button(action: {self.sizeCoffee = objectCoffee.price + 20}, label: {
//                        Image("size03")
//                    })
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
                    .frame(width: 200)
                    }
                    // теперь это кнопки
//                    Button(action: {self.sugarCount = 0}, label: {
//                        Image("sugar01")
//                    })
//
//                    Button(action: {self.sugarCount = 10 }, label: {
//                        Image("sugar02")
//                    })
//
//                    Button(action: {self.sugarCount = 20 }, label: {
//                        Image("sugar03")
//                    })
//
//
//                    Button(action: {self.sugarCount = 30}, label: {
//                        Image("sugar04")
//                    })
                    
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
                        Image("addit03").tag(7)
                        Image("addit04").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: 100)
                    }
                    // теперь это кнопки
//                    Button(action: {self.addit = 0}, label: {
//                        Image("addit01")
//                    })
//
//                    Button(action: {self.addit = 20}, label: {
//                        Image("addit02")
//                    })
                }
                .frame(height: 50)
                Divider()
                    .frame(height: 2)
                    .background((Color("fontcolor")))
                HStack(alignment: .bottom) {
                    Text("Итого: ")
                        .font(.system(size: 32)).bold().italic()
                    Spacer()
                    Text("\((sizeCoffee + sugarCount + addit) * numberOfCoffee)")
                        .font(.system(size: 32)).bold().italic()
                }
                
            }
            
            .foregroundColor(Color("menufont"))
            .font(.system(size: 20))
                .padding(.horizontal)
            Button(action: {
                self.showAlertMessage.toggle()
            }) {
                Text("В корзину")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .padding()
            }
            .background(Color("buttoncolor"))
            .cornerRadius(30)
            .padding(.top, 16)
            .alert(isPresented: self.$showAlertMessage) {
                Alert(title: Text("ТОВАРИЩ!"), message: Text("А теперь самое интересное: просьба закрыть окно, сделать скриншот и отправить на почту dhfkjsd@gmail.com. Не факт что и это дойдет, поэтому лучше звоните по телефону +77987239234, может ответим"), primaryButton: .default (Text("OK")),
                      secondaryButton: .cancel())
            }
            Spacer()
                            
        }

    }
}
//Не пойму для чего нужна нижестоящая структура. Не буду удалять, может какую то она нагрузку несла, но судя по тому что я ее закоментил и все работает, я так понимаю что никакой нагрузки не было
//struct ZakazCoffee: Identifiable {
//    var id = UUID()
//    var quantity: String
//    var sizeCoffee: String
//    var sugarCoffee: String
//    var additionsCoffee: String
//    var totalPrice: String
//}


struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences(objectCoffee: coffeeData[1])
    }
}
