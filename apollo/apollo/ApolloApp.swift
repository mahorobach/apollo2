//
//  ApolloApp2.swift
//  apollo
//
//  Created by 赤尾浩史 on 2025/01/06.
//

import SwiftUI
import KAPIF

class ApolloDelegate: KAPIDelegate{
    weak var appState: ApolloAppState?
    
    func kapiError(alert: KAPIF.KAPI.AlertText) {
        appState?.errorMessage = alert.msg
    }
        func kapiMustUpdate() {
            print("Update Error1")
        }
        func kapiMustLogin() {
            print("=== デリゲートイベント: ログイン要求 ===")
            print("現在のスタック: \(Thread.callStackSymbols)")
            print("Login Error 2")
        }
        func kapiMustFinishRegister() {
            print("Registration Error 3")
        }
        func kapiBanned() {
            print("Banned Error 4")
        }
}
 
class ApolloAppState: ObservableObject {
    @Published var authState: AuthState = .notLoggedIn
    @Published var errorMessage: String?
    
    let kapi : KAPIF.KAPI
    private let authDelegate: ApolloDelegate
    
    enum AuthState {
            case notLoggedIn
            case loggedIn
        }
        
        init() {
            self.authDelegate = ApolloDelegate()
            self.kapi = KAPIF.KAPI(delegate: authDelegate)
            self.authDelegate.appState = self
            
            if kapi.resetAndRestoreLoginStateIfRegistered_isNowRegistered() {
                        self.authState = .loggedIn
                    }
        }
    
    func validateSession() -> Bool {
            let sessionInfo = kapi.getSessionInfo()
            return !sessionInfo.isEmpty && sessionInfo != "nil"
        }   
}

extension ApolloAppState {
    func debugSession() {
        print("=== セッション状態のデバッグ ===")
        print("現在のセッション情報: \(kapi.getSessionInfo())")
        print("ログイン状態: \(authState)")
        print("========================")
    }
}


@main
struct ApolloApp: App {
    @StateObject private var apolloAppState = ApolloAppState()
    var body: some Scene {
        WindowGroup {
            Group {
                if apolloAppState.authState == .loggedIn {
                    MainTabView()
                        .environmentObject(apolloAppState)
                } else {
                    LoginView()
                        .environmentObject(apolloAppState)
                }
            }
        }
    }
}
