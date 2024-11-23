//
//  LoginView2.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/19.
//

import SwiftUI
import KAPIF

struct LoginView2: View {
    @State private var phoneNumber: String = ""
     @State private var showingAlert = false
     @State private var alertTitle: String = ""
     @State private var alertMessage: String = ""
    @State private var isShowing1 = false
    @State private var isShowing2 = false
     
    weak  var delegate: KAPIDelegate?
    private var kapiresult = KAPI.Result.self
    
     var body: some View {
         VStack {
             TextField("電話番号を入力してください", text: $phoneNumber)
                 .keyboardType(.phonePad)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()

             

             Button(action: loginButtonTapped) {
                 Text("ログイン")
                     .font(.headline)
                     .padding()
                     .frame(maxWidth: .infinity)
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(10)
             }
             .padding()
             
             Button(action: {
                 isShowing1 = true
             }){
                 Text("送信")
                     .font(.title2)
                     .foregroundStyle(.white)
                     .frame(width: 300, height: 50)
                     .background(Color(.systemCyan))
             }
             .fullScreenCover(isPresented: $isShowing1) {
                 Verification()
             }
         }
         .padding()
         .alert(isPresented: $showingAlert) {
             Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
         }
         .onAppear {
//             kapi = KAPIF.KAPI(delegate: self)
         }
     }

    
    
     private func loginButtonTapped() {
         guard !phoneNumber.isEmpty else {
             showAlert(title: "エラー", message: "電話番号を入力してください。")
             return
         }
         ApolloApp().kapi.register(keitai: phoneNumber) { result in
             switch result {
                         case .okData(let uid):
                 Verification()
                               print(uid)
                         case .errorAlert(let alertText):
                             if let alert = alertText {
                                 showAlert(title: alert.title, message: alert.msg)
                             } else {
                                 showAlert(title: "エラー", message: "不明なエラーが発生しました。")
                             }
                         default:
                             showAlert(title: "エラー", message: "予期しないレスポンスが返されました。")
                         }
                     }
                 }
    

     private func navigateToMainScreen() {
         // メイン画面への遷移を実装
     }
     
     private func showAlert(title: String, message: String) {
         alertTitle = title
         alertMessage = message
         showingAlert = true
     }
 }


/*
 
 /// 成功の際は ok系が帰ってくるが、どれを期待するかについては該当する API の説明を見てください。
 public enum Result {

     case ok

     case okData(Data)

     case okChannelList([KAPIF.KAPI.ChannelInfo])

     case okChannelMessageList([KAPIF.KAPI.ChannelMessageInfo])

     case errorAlert(KAPIF.KAPI.AlertText?)
 }

 /// ログイン（ご自身の電話番号以外絶対に入力しないでください）。成功の際は Result.okData に uid というものが入ります
 public func register(keitai: String, _ result: @escaping (KAPIF.KAPI.Result) -> Void)

 
 
 extension LoginView2: KAPIDelegate {
     func kapiError(alert: KAPIF.KAPI.AlertText) {
         showAlert(title: alert.title, message: alert.msg)
     }

     func kapiMustUpdate() {
         showAlert(title: "アップデートが必要です", message: "アプリを続けて利用するには、アップデートが必要です。")
     }

     func kapiMustLogin() {
         showAlert(title: "セッションの有効期限が切れました", message: "再度ログインしてください。")
     }

     func kapiMustFinishRegister() {
         showAlert(title: "登録が必要です", message: "登録を完了してください。")
     }

     func kapiBanned() {
         showAlert(title: "利用停止", message: "あなたのアカウントは利用できなくなりました。")
     }
 }

 
#Preview {
    LoginView2()
}
 */
