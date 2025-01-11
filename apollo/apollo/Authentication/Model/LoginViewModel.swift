//
//  LoginViewModel.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/08/24.
//

import SwiftUI

class LoginViewModel:  ObservableObject{
    @Published var phonenumber : String = ""
    @Published var smsCode: String = ""
    @Published var showing: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var uid: Data? = nil
    @Published var errorMessage: String = ""
    @State private var isUidReceived: Bool = false
    
    private var appState: ApolloAppState?
    
    func setAppState(_ state: ApolloAppState) -> LoginViewModel {
        self.appState = state
        return self
    }
    
    func registerPhoneNumber() {
        print("=== 登録処理開始 ===")
        print("電話番号: \(phonenumber)")
        guard let appState = appState else { return }
        appState.kapi.register(keitai: phonenumber) { result in
            switch result {
            case .okData(let data) :
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
                    print("エラー: \(self.errorMessage)")
                }
            default :
                self.errorMessage = "エラー発生"
                print("エラー: \(self.errorMessage)")
            }
        }
    }
    
    func verifySmsCode(){
        print("=== SMS認証開始 ===")
        print("UID存在: \(uid != nil)")
        guard let appState = appState else { return }
        guard let uidData = uid else {
            errorMessage = "UIDがnilです。"
            print("エラー: UIDがnilです。")
            return
        }
        print("送信するUID: \(uidData), Code: \(smsCode)")
        appState.kapi.verify(uid: uidData, code: smsCode) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .ok:
                self.isLoggedIn = true
                self.appState?.authState = .loggedIn
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
