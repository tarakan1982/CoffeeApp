//
//  LoginPage.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginPage: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("С возвращением!")
                            .font(.system(size: 32)).bold().italic()
                        .foregroundColor(Color("fontcolor"))
                    Spacer() //Крайне интересно, почему кроме как спейсером, надпись не хочет больше располагаться не по левому не по правому краю. Шляпа какая то
                }
                .padding(.bottom, 30)
                HStack {
                    Text("Введите свои данные:")
                        .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2901960784, blue: 0.3490196078, alpha: 1)))
                    Spacer()
                }
                    TextField("Email", text: $emailTextField)
                    .font(.system(size: 18, weight: .semibold))
                Rectangle()
                    .foregroundColor(Color("fontcolor"))
                    .frame(width: .infinity, height: 2, alignment: .center)
                SecureField("Пароль", text: $passwordTextField)
                    .font(.system(size: 18, weight: .semibold))
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2901960784, blue: 0.3490196078, alpha: 1)).opacity(0.45))
                    .frame(width: .infinity, height: 2, alignment: .center)
                    .padding(.bottom, 14)
                Button(action: {
                    
                }) {
                    HStack {
                        Spacer()
                    Text("Напомнить пароль")
                        .font(.system(size: 14)).bold().italic()
                        .foregroundColor(Color("buttoncolor"))
                    }
                } .padding(.bottom, 24)
                Button(action: {
                    signInWithEmail(email: self.emailTextField, password: self.passwordTextField) { (verified, status) in
                        if !verified {
                            self.message = status
                            self.alert.toggle()
                        } else {
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                }) {
                    Text("Войти")
                }
                
                .padding(15)
                .padding(.horizontal, 100) //надо посмотреть как сделать так, чтобы кнопка ресайзилась от края до края. просто ставить тут большую цифру нет смысла, на мелких экранах вылезет за края. Заключать во фрейм с шириной инфинити не прокатило, жаль.
                .background(Color("buttoncolor"))
                .foregroundColor(.white)
                .cornerRadius(30)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("OK")))
                }
                HStack {
                    Text("До сих пор нет аккаунта?")
                        .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2901960784, blue: 0.3490196078, alpha: 1)).opacity(0.45))
                    Button(action: {
                        signUpWithEmail(email: self.emailTextField, password: self.passwordTextField) { (verified, status) in
                            if !verified {
                                self.message = status
                                self.alert.toggle()
                            } else {
                                UserDefaults.standard.set(true, forKey: "status")
                                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                            }
                        }
                    }) {
                        Text("Регистрация")
                            .foregroundColor(Color("buttoncolor"))
                    }
                    .sheet(isPresented: $show) {
                        LoginPage()
                    }
                }
                Spacer()
                }
            .padding(.horizontal)
            .navigationBarTitle("Вход")//Ну к этому есть ряд вопросов: как поменять цвет, как поднять выше. Можно попробовать без Навигейшена вовсе обойтись и тогда будет все гораздо проще, но на следующих экранам мне это сильно аукнется
            
        }
    }
}

struct HomeMessage: View {
    var body: some View {
        VStack {
            Text("Home")
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            }) {
                Text("Logout")
            }
        }
    }
}

func signInWithEmail(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
        if err != nil {
            completion(false, (err?.localizedDescription)!)
            return
        }
        completion(true, (res?.user.email)!)
    }
}
func signUpWithEmail(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
        if err != nil {
            completion(false, (err?.localizedDescription)!)
            return
        }
        completion(true, (res?.user.email)!)
    }
}



struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
