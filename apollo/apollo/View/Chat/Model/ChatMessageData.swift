//
//  ChatMessageModel.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/17.
//

import SwiftUI

struct ChatMessageData: Identifiable{
    var id = NSUUID().uuidString
    let from: Bool
    let messageText: String
    let timestamp: String
    
}

struct ChatMessage {
    let chatmessageArray = [
        ChatMessageData(from: true, messageText: "応募します" , timestamp:"2023年12月1日"),
        ChatMessageData(from: false, messageText: "ありがとうございます", timestamp:"2023年11月23日")
        ]
}


