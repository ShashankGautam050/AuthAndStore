//
//  File.swift
//  AuthAndStore
//
//  Created by Shashank Gautam on 03/02/26.
//

import Foundation
import Observation

//1.import firbaseAuth and firebaseStore
import FirebaseAuth
import FirebaseFirestore


@MainActor
@Observable
final class AuthAndStoreViewModel {
    var userSession : FirebaseAuth.User?
    var user : AuthAndStoreModel?
    var isError : Bool = false
    let auth = Auth.auth()
    private let store = Firestore.firestore()
    
    init() {
        
    }
    
    func loadCurrentUser() async {
        let user = auth.currentUser
        userSession = user
       await getUserById(uid: user?.uid ?? "")
    }
    
    
    func login(email : String,password : String) async {
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await getUserById(uid: authResult.user.uid)
            print("Current User \(user)")
        } catch {
            isError = true
        }
    }
    
    func createUser(email : String,password : String,fullname : String) async {
        do {
            let authResult = try await auth.createUser(withEmail: email, password: password)
            await storeInFireBase(uid: authResult.user.uid, email: email , fullName: fullname)
        } catch {
            isError = true
        }
    }
    
    func storeInFireBase(uid : String,email : String,fullName : String,) async {
        let user = AuthAndStoreModel(uid: uid, email: email, fullName: fullName)
        do {
            try store.collection("users").document(uid).setData(from : user)
        } catch {
            isError = true
        }
    }
    
    func getUserById(uid : String) async {
        do {
            let document = try await store.collection("users").document(uid).getDocument()
            user = try document.data(as: AuthAndStoreModel.self)
        } catch {
            isError = true
        }
    }
    
    func signOut() {
        do {
            user  = nil
            userSession = nil
            try auth.signOut()
        } catch {
            isError = true
        }
    }
}
