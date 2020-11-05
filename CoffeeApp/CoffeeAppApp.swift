//
//  CoffeeAppApp.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct CoffeeAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginPage()
        }
    }
}
