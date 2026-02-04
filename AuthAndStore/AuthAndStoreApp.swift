//
//  AuthAndStoreApp.swift
//  AuthAndStore
//
//  Created by Shashank Gautam on 03/02/26.
//

import SwiftUI

import FirebaseCore
import Observation
import FirebaseAuth


@main
struct AuthAndStoreApp: App {
   
    @State var vm : AuthAndStoreViewModel
    
    init() {
        FirebaseApp.configure()
        _vm = .init(initialValue: AuthAndStoreViewModel())
    }
    var body: some Scene {
        WindowGroup {
            
            if vm.auth.currentUser != nil{
                HomeScreen(authviewModel: vm)
            }
            else {
                LoginScreen(vm: vm)
            }
        }
    }
}
