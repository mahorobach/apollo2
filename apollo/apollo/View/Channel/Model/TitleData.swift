//
//  TitleData.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI


struct TitleData: Identifiable {
    var id = UUID()
    var title:String
    var subtitle: String
    var koudoku:String
    var value:String
    var page:String
}

struct Title {
    let titleArray = [
        TitleData(title: "イシキカイカク.com", subtitle: "イシキカイカク情報発信", koudoku: "購読中", value: "無料", page:"MailmagaView"),
        TitleData(title: "お問い合わせチャンネル", subtitle: "本アプリの感想などはこちらへ", koudoku: "購読中", value: "無料",page:"AccessView")
    ]
    
}
