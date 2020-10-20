//
//  OnBoarding.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        VStack(spacing: 30) {
            Image("artwork")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 50)
            Text("Самый лучший кофе\n только у нас")
                .font(.system(size: 32)).bold().italic()
                .multilineTextAlignment(.center)
                .foregroundColor(Color("fontcolor"))
            HStack(spacing: 30) {
                Button(action: {
                    
                }) {
                    Text("Регистрация")
                }
                .padding(15)
                .padding(.horizontal, 10)
                .background(Color("buttoncolor"))
                .foregroundColor(.white)
                .cornerRadius(30)
                Button(action: {
                    
                }) {
                    Text("Войти")
                }
                .padding(15)
                .padding(.horizontal, 10)
                .foregroundColor(Color("buttoncolor"))
                .cornerRadius(30)
                .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("buttoncolor"), lineWidth: 2))
            }
            
            Button(action: {
                
            }) {
                Image("facebook")
                Text("Зайти по FaceBook")
            }
            .padding(15)
            .padding(.horizontal, 40)
            .foregroundColor(Color(#colorLiteral(red: 0.2588235294, green: 0.4666666667, blue: 0.737254902, alpha: 1)))
            .cornerRadius(30)
            .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(#colorLiteral(red: 0.2588235294, green: 0.4666666667, blue: 0.737254902, alpha: 1)), lineWidth: 2))
            Spacer()
            
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
