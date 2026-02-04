//
//  HomeScreen.swift
//  AuthAndStore
//
//  Created by Shashank Gautam on 03/02/26.
//

import SwiftUI

struct HomeScreen: View {
    @State private var navigateToProfile = NavigationPath()
    @Bindable var authviewModel : AuthAndStoreViewModel
    var body: some View {
        NavigationStack(path : $navigateToProfile){
            VStack{
                Text("Home Screen,You are here because you already logged in")
                    .frame(alignment : .center)
                    .navigationBarTitle("Home")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                Task {
                                   await authviewModel.loadCurrentUser()
                                }
                                if let user = authviewModel.user {
                                       navigateToProfile.append(user)
                                   }
                            } label: {
                                Image(systemName: "person.crop.circle")
                            }
                            
                            
                            
                        }
                    }
            }
            .navigationDestination(for: AuthAndStoreModel.self) { user in
                ProfileView(user: user,vm: authviewModel)
            }
        }
    }
}

#Preview {
    HomeScreen(authviewModel: AuthAndStoreViewModel())
}
