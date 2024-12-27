//
//  apolloApp.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/10/17.
//

import SwiftUI
import KAPIF

class DummyDelegate: KAPIDelegate{
  
    func kapiError(alert: KAPIF.KAPI.AlertText) {
        print("KAGURAはメルマガ送信アプリとなり、\n 意見交換、質問の受付は承っておりません。\n\n以前よりご意見やご質問の返信は\n控えていただくようお願いしておりましたが、\n現在も多数のメッセージ送信が続くため\n返信機能は停止しております。")
    }
        func kapiMustUpdate() {
            print("Update Error1")
        }
        func kapiMustLogin() {
            print("Login Error 2")
        }
        func kapiMustFinishRegister() {
            print("Registration Error 3")
        }
        func kapiBanned() {
            print("Banned Error 4")
        }
}
 


@main
struct ApolloApp: App {
    var delegate: KAPIDelegate?
    var kapi = KAPIF.KAPI(delegate: DummyDelegate())
    var body: some Scene {
        WindowGroup {

            LoginView()
        }
    }
}
