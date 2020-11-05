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
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View {
        VStack {
            if status {
              TabViewBottom()
            } else {
                DesignLoginWindow()
            }
        }
        .animation(.spring())
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
        }
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

struct DesignLoginWindow: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Добро пожаловать!")
                            .font(.system(size: 32)).bold().italic()
                        .foregroundColor(Color("fontcolor"))
                    Spacer() //Крайне интересно, почему кроме как спейсером, надпись не хочет больше располагаться не по левому не по правому краю. Шляпа какая то
                }
                .padding(.bottom, 30)
                HStack {
                    VStack {
                    Image("artwork")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Введите свои данные:")
                        .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2901960784, blue: 0.3490196078, alpha: 1)))
                    }
                    Spacer()
                }
                    TextField("Email", text: $emailTextField)
                    .font(.system(size: 18, weight: .semibold))
//                if emailTextField != "" {
//                    Image(systemName: "checkmark.circle")
//                }
//                Rectangle()
//                    .foregroundColor(Color("fontcolor"))
//                    .frame(width: .infinity, height: 2, alignment: .center)
                Divider()
                SecureField("Пароль", text: $passwordTextField)
                    .font(.system(size: 18, weight: .semibold))
//                Rectangle()
//                    .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2901960784, blue: 0.3490196078, alpha: 1)).opacity(0.45))
//                    .frame(width: .infinity, height: 2, alignment: .center)
                    Divider()
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
                        }
                        else{
                            
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                }) {
                    Text("Войти")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 80)
                        .padding()
                }
                
                .background(Color("buttoncolor"))
                .cornerRadius(30)
                .alert(isPresented: $alert) {
                    
                    Alert(title: Text("Ошибка"), message: Text(self.message), dismissButton: .default(Text("Ok")))
            }
                }
                HStack {
                    Text("До сих пор нет аккаунта?")
                        .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2901960784, blue: 0.3490196078, alpha: 1)).opacity(0.45))
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Text("Регистрация")
                            .foregroundColor(Color("buttoncolor"))
                    }
                    
                }
                .sheet(isPresented: $show) {
                    RegistrationForm(show: self.$show)
                }
                Spacer()
                }
            .padding(.horizontal)
            .navigationBarTitle("Вход")//Ну к этому есть ряд вопросов: как поменять цвет, как поднять выше. Можно попробовать без Навигейшена вовсе обойтись и тогда будет все гораздо проще, но на следующих экранам мне это сильно аукнется
            
    }
}

struct RegistrationForm : View {
    
    @State var emailTextField = ""
    @State var passwordTextField = ""
    @State var message = ""
    @State var alert = false
    @Binding var show : Bool
    
    var body : some View{
        
        VStack{
            Image("artwork")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Регистрация")
                .font(.system(size: 32)).bold().italic()
            .foregroundColor(Color("fontcolor"))
                .padding([.top,.bottom], 20)
            
            VStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    
                    Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    HStack{
                        
                        TextField("Введите свою почту", text: $emailTextField)
                        
                        if emailTextField != ""{
                            
                            Image("check").foregroundColor(Color.init(.label))
                        }
                        
                    }
                    
                    Divider()
                    
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading){
                    
                    Text("Пароль").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    SecureField("Придумайте пароль", text: $passwordTextField)
                    
                    Divider()
                }
                
            }.padding(.horizontal, 6)
            .padding(.bottom, 26)
            
            Button(action: {
                
                signUpWithEmail(email: self.emailTextField, password: self.passwordTextField) { (verified, status) in
                    
                    if !verified{
                        
                        self.message = status
                        self.alert.toggle()
                        
                    }
                    else{
                        
                        UserDefaults.standard.set(true, forKey: "status")
                        
                        self.show.toggle()
                        
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
                
            }) {
                
                Text("Регистрация")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .padding()
            }
            .background(Color("buttoncolor"))
            .cornerRadius(30)
            HStack {
                Spacer()
                Button(action: {
                    //сделать закрытие при нажатии на кнопку
                    
                }) {
                Text("Выход")
                }
                .padding(.top, 16)
                .padding(.trailing, 10)
            }
        }.padding()
            .alert(isPresented: $alert) {
                
                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
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
