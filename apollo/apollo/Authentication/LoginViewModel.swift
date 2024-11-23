//
//  LoginViewModel.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/08/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var phonenumber : String = ""
    @Published var smsCode: String = ""
    @Published var showing: Bool = false
    @Published var isLoggedIn: Bool = false
    
    //uidを公にしてエラーが解消
    @Published var uid: Data? = nil
    @State private var isUidReceived: Bool = false
    @State private var errorMessage: String?
//    @State private var uid: Data? = nil
    
    let kapi = ApolloApp().kapi
    
    func registerPhoneNumber() {
        kapi.register(keitai: phonenumber) { result in
            switch result {
            case .okData(let data) :
                /*
                self.uid = data
                self.showing = true
                */
                if data.isEmpty {
                                self.errorMessage = "UIDデータが空です。"
                                print("エラー: UIDデータが空")
                                return
                            }
                            self.uid = data
                            print("取得したUID: \(self.uid?.description ?? "なし")")
                            self.showing = true
            case .errorAlert(let alertText):
                if let alert = alertText {
                    self.errorMessage = alert.title  + alert.msg
                    print("エラー: \(self.errorMessage!)")
                }
            default :
                self.errorMessage = "エラー発生"
                print("エラー: \(self.errorMessage!)")
            }
        }
    }
    
    func verifySmsCode(){
        
        guard let uidData = uid else {
            errorMessage = "UIDがnilです。"
                    print("エラー: UIDがnilです。")
            return
        }
        print("送信するUID: \(uidData), Code: \(smsCode)")
        kapi.verify(uid: uidData, code: smsCode) { result in
            switch result {
            case .ok:
                self.isLoggedIn = true
                print("ログイン成功")
            case .errorAlert(let alertText):
                if let alert = alertText {
                    self.errorMessage = alert.title + ": ninsho" + alert.msg
                }
                default :
                self.errorMessage =  "ログイン失敗"
            }
        }
    }
    
}
