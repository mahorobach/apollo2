//
//  ChannelMessageModel.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/11/21.
//

import SwiftUI
import KAPIF

class ChannelMessageModel: ObservableObject {
    @Published var messages = [KAPIF.KAPI.ChannelMessageInfo]()
    @Published var errorMessage: String?
    
    let kapi = ApolloApp().kapi
    
    func fetchMessages(for channelID:Data) {
        kapi.getChannelMessageList(channelID: channelID) { result in
            switch result {
            case.okChannelMessageList(let messages):
                DispatchQueue.main.async {
                    self.messages = messages
                    print("メッセージ一覧取得成功：\(messages.count)件")
                }
            case .errorAlert(let alertText):
                if let alert = alertText {
                    DispatchQueue.main.async {
                        self.errorMessage  = alert.title + ":" + alert.msg
                    }
                }
            default :
                DispatchQueue.main.async {
                    self.errorMessage = "エラーが発生しました。"
                }
            }
        }
    }
}
