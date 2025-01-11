//
//  Verification.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/19.
//

import SwiftUI

struct Verification: View {
    @EnvironmentObject var appState: ApolloAppState
    //    @State private var uid = ""
    //    @State private var showing = false
  
    @ObservedObject var viewModel : LoginViewModel
    /*
     init(viewModel: LoginViewModel) {
     self.viewModel = viewModel
     }
     */
    var body: some View {
  //      let _ = viewModel.setAppState(appState)
        NavigationStack{
            VStack{
                Text("入力された携帯電話番号宛に送信されたショートメール(SMS)に記載された認証コードを下記にご入力ください")
                    .padding()
                Divider()
                HStack{
                    Text("認証コード")
                    TextField("認証コードを入力してください", text: $viewModel.smsCode, axis: .vertical)
                        .padding(12)
                        .padding(.trailing, 48)
                }
                .padding(.horizontal)
                Divider()
                Button(action: {
                    //                   showing = true
                    viewModel.verifySmsCode()
                }){
                    Text("送信")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 50)
                        .background(Color(.systemCyan))
                }
                .padding()
                .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
                    MainTabView()
                        .environmentObject(appState)
                }
                Text("10分経ってもショートメールが届かない場合は、お手数ですが前の画面に戻って、再度お試しください")
                    .padding(.horizontal)
                Spacer()
            }
   
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            .navigationBarTitle("本人確認")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("本人確認")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
            }
        }
        /*
        .onAppear {
                    viewModel.setAppState(appState)
                }
         */
    }
    
}
/*
 #Preview {
 Verification()
 }
 */
