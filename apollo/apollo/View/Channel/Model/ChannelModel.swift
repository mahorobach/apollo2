//
//  ChannelModel.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/11/13.
//

import SwiftUI
import KAPIF

class ChannelModel: ObservableObject {
    @Published var channelList = [KAPIF.KAPI.ChannelInfo]()
    @Published var errorMessage: String?
    
    let kapi = ApolloApp().kapi
    
    
    
    func fetchChannelList() {
        // セッション状態を確認
                if kapi.resetAndRestoreLoginStateIfRegistered_isNowRegistered() {
                    // セッションが有効ならチャンネルリストを取得
                    getChannelList()
                    
                } else {
                    // セッションが無効なら再ログイン
                    errorMessage = "セッションが切れています。再ログインしてください。"
                    print("セッションが切れています。再ログインが必要です。")
                }
            }
   
    func getSession() {
        let  sessionInfo = kapi.getSessionInfo()
        print("現在のセッション情報：\(sessionInfo)")
    }
    
    
    
    private func getChannelList() {
        kapi.getChannelList() { result in
            switch result {
            case .okChannelList(let channels):                                    DispatchQueue.main.async {
                self.channelList = channels
                print("チャンネルリスト取得成功")
            }
            case .errorAlert(let alertText):                                    if let alert = alertText {
                DispatchQueue.main.async {
                    self.errorMessage = alert.title + ": " + alert.msg
                }
            }
            default :                                    DispatchQueue.main.async {
                self.errorMessage = "エラーが発生しました。"
            }
            }
        }
    }
}
