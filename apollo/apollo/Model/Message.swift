//
//  Message.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/19.
//

import Foundation
import SwiftUI


struct Message: Identifiable{
    var id = NSUUID().uuidString
    let fromId:String
    let toId:String
    let messageText: String
    let timestamp: String
    
    var user: User?
}
