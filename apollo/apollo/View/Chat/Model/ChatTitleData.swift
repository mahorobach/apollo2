//
//  ChatTitle.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/18.
//

import SwiftUI


struct ChatTitleData: Identifiable {
    var id = UUID()
    var pagetitle: String
    var from: Bool
    var submessage: String
    var timestamp: String
}

struct ChatTitle {
    let chattitleArray = [
        ChatTitleData(pagetitle: "イシキカイカク.com", from: false, submessage: "応募します", timestamp:"2023年12月1日"),
        ChatTitleData(pagetitle: "お問い合わせチャンネル", from: true, submessage: "ありがとうございます", timestamp:"2023年11月23日")
        ]
}

