//
//  User.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/17.
//

import Foundation

struct User:Codable, Identifiable, Hashable{
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    let password: String
    
}

extension User {
    static let MOC_USER = User(fullname: "赤尾浩史", email: "test@gmail.com", password: "0123456")
}
