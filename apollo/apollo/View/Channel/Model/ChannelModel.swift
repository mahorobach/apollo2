//
//  ChannelModel.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/11/13.
//

import SwiftUI
import KAPIF

class ChannelModel: ObservableObject {
    
    @Published var channelList : [KAPIF.KAPI.ChannelInfo] = []
    @Published var messages : [KAPIF.KAPI.ChannelMessageInfo] = []
    @Published var errorMessage: String? =  nil
 
    private var appState: ApolloAppState
 
    init(appState: ApolloAppState) {
        self.appState = appState
    }
 
    func getSession() {
        let  sessionInfo = appState.kapi.getSessionInfo()
        print("現在のセッション情報：\(sessionInfo)")
    }
     
    func getChannelList() {
        appState.kapi.getChannelList() { result in
            switch result {
            case .okChannelList(let channels):                                    DispatchQueue.main.async {
                self.channelList = channels
                print("チャンネルリスト取得成功")
            }
            case .errorAlert(let alertText):
                if let alert = alertText {
                DispatchQueue.main.async {
                    self.errorMessage = alert.title + ": " + alert.msg
                }
            }
            default :
                DispatchQueue.main.async {
                self.errorMessage = "エラーが発生しました。"
            }
            }
        }
    }
   
    
    func getChannelMessaage(channelID: Data){
        appState.kapi.getChannelMessageList(channelID: channelID) { result in
            switch result {
            case .okChannelMessageList(let messages):
                DispatchQueue.main.async {
                    self.messages = messages
                    print("メッセージ取得成功")
                }
            case .errorAlert(let alertText):
                if let alert = alertText {
                    DispatchQueue.main.async {
                        self.errorMessage = alert.title + ": " + alert.msg
                    }
                }
            default:  
                        DispatchQueue.main.async {
                            self.errorMessage = "予期せぬエラーが発生しました。"
                        }
            }
        }
    }
}


/*
 public struct ChannelMessageInfo : Identifiable {

     /// The stable identity of the entity associated with this instance.
     public let id: Data

     public let koukaiDate: Date

     public let naiyou: String
 }
 */
