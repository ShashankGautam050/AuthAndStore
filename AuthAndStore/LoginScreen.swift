//
//  LoginScreen.swift
//  AuthAndStore
//
//  Created by Shashank Gautam on 03/02/26.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var showSignUp : Bool = false
    @Bindable var vm : AuthAndStoreViewModel
    @State private var isLoggedIn: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment : .center, spacing: 20){
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.green)
                        .frame(width: 160, height: 160)
                        .padding(.top,56)
                    
                    Text("Login Account")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                        .padding()
                    
                    TextField("email ", text: $email)
                        .padding()
                        .background {
                           RoundedRectangle(cornerRadius: 24)
                                .stroke(Color(.green), lineWidth: 2)
                        }
                    
                    TextField("password ", text: $password)
                        .padding()
                        .background {
                           RoundedRectangle(cornerRadius: 24)
                                .stroke(Color(.green), lineWidth: 2)
                        }

                    Button {
                        print("create account btn clicked")
                        Task {
                           await vm.login(email: email, password: password)
                            if vm.user?.email != nil {
                               isLoggedIn = true
                            }
                        }
                    } label: {
                        Text("Login Account")
                            .padding()
                            .foregroundStyle(Color(.white))
                            .frame(maxWidth: .infinity)
                    }
                    .background(Color.green)
                    .clipShape(Capsule())
                   
                    Spacer()
                    
                    Button {
                        print("dont have an account btn clicked")
                        showSignUp = true
                    } label: {
                        Text("Don't have an account? Sign Up")
                            .foregroundStyle(.green)
                    }

                    

                }
                .sheet(isPresented: $showSignUp, content: {
                    CreateScreen(vm: vm)
                        .presentationDragIndicator(.visible)
                })
                .fullScreenCover(isPresented: $isLoggedIn, content: {
                    HomeScreen(authviewModel: vm)
                })
                .padding()
            }
        }
    }
}

#Preview {
    LoginScreen(vm: AuthAndStoreViewModel())
}
