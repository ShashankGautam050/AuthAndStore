//
//  AuthAndStoreModel.swift
//  AuthAndStore
//
//  Created by Shashank Gautam on 03/02/26.
//

import Foundation

struct AuthAndStoreModel : Codable,Hashable{
    var uid : String
    let email : String
    let fullName : String
}
