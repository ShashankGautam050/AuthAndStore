//
//  CreateScreen.swift
//  AuthAndStore
//
//  Created by Shashank Gautam on 03/02/26.
//

import SwiftUI

struct CreateScreen: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var fullName : String = ""
    @Environment(\.dismiss) var dismiss
    @Bindable var vm : AuthAndStoreViewModel
    var body: some View {
    
            ScrollView{
                VStack(alignment : .center, spacing: 20){
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.green)
                        .frame(width: 160, height: 160)
                        .padding(.top,56)
                    
                    Text("Create Account")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                        .padding()
                    TextField("Fullname ", text: $fullName)
                        .padding()
                        .background {
                           RoundedRectangle(cornerRadius: 24)
                                .stroke(Color(.green), lineWidth: 2)
                        }
                    
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
                            await vm.createUser(email: email, password: password, fullname: fullName)
                        }
                        
                        dismiss()
                    } label: {
                        Text("Create Account")
                            .padding()
                            .foregroundStyle(Color(.white))
                            .frame(maxWidth: .infinity)
                    }
                    .background(Color.green)
                    .clipShape(Capsule())
                   
                    Spacer()
                    
                    Button {
                        print("already have an account clicked")
                        dismiss()
                    } label: {
                        Text("Already have an account? Login")
                            .foregroundStyle(.green)
                    }

                    

                }
                .padding()
            }
        }
    
}

#Preview {
    CreateScreen(vm: AuthAndStoreViewModel())
}
