//
//  MyDataPage.swift
//  CoffeeApp
//
//  Created by Дмитрий on 03.11.2020.
//

import SwiftUI

struct MyDataPage: View {
    @State var myName: String = ""
    @State var mySurname: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top, spacing: 14) {
                Image("avatar")
                    .resizable().frame(width: 200, height: 200, alignment: .leading)
                    .cornerRadius(20)
                VStack(alignment: .leading) {
                    Text("Имя: ")
                    TextField("Ваше имя", text: $myName)
                    .font(.system(size: 18, weight: .semibold))
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
                    .padding(.bottom, 30)
                    Text("Фамилия: ")
                    TextField("Фамилия", text: $mySurname)
                    .font(.system(size: 18, weight: .semibold))
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
                }
                .foregroundColor(Color("menufont"))
                .font(.system(size: 20))
                Spacer()
                
            }
            .padding(.horizontal)
                Spacer()

                HStack {
                Button(action: {
                    
                }) {
                    Text("Сохранить")
                }
                
                .padding(15)
                .background(Color("buttoncolor"))
                .cornerRadius(30)
                .padding(.horizontal)
                .padding(.top, 30)
                .foregroundColor(.white)
            
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }) {
                        Text("Выход")
                    }
                    
                    .padding(15)
                    .background(Color("buttoncolor"))
                    .cornerRadius(30)
                    .padding(.horizontal)
                    .padding(.top, 30)
                    .foregroundColor(.white)
                }
                .padding(.bottom, 30)
            }
            .padding(.top, 14)
            .navigationBarTitle("О себе", displayMode: .inline)
            
        }
    }
}

struct MyDataPage_Previews: PreviewProvider {
    static var previews: some View {
            MyDataPage()
    }
}
