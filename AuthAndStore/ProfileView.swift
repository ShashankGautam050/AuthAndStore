//
//  ProfileView.swift
//  AuthAndStore
//
//  Created by Shashank Gautam on 04/02/26.
//

import SwiftUI

struct ProfileView: View {
    var user : AuthAndStoreModel
    @Bindable var vm : AuthAndStoreViewModel
    @State var loggedOut : Bool = false
    var body: some View {
        VStack(spacing : 12){
            HStack(spacing :12){
                Text("Full Name :")
                Text(user.fullName)
            }
            HStack(spacing : 12){
                Text("email :")
                Text(user.email)
            }
            
            Button {
                vm.signOut()
                loggedOut = true
            } label: {
                Text("Sign Out")
                    .padding(.horizontal)
                    .padding(.vertical,6)
            }
            .buttonStyle(.borderedProminent)

        }
        .fullScreenCover(isPresented: $loggedOut, content: {
            LoginScreen(vm: vm)
        })
    }
}

#Preview {
    ProfileView(user: AuthAndStoreModel(uid: "123", email: "exapmle@gmail.com", fullName: "dummy"),vm: AuthAndStoreViewModel())
}
