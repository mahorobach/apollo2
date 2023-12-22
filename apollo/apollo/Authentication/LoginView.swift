//
//  LoginView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/19.
//

import SwiftUI

struct LoginView: View {
    @State private var telenumber = ""
    @State private var isShowing1 = false
    @State private var isShowing2 = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Divider()
                Section{
                    Text("携帯電話番号のみで利用開始およびログインができます。\nパスワードを覚える必要はありません。")
                }
                .padding(.horizontal)
                Divider()
                Section{
                    HStack{
                        Text("携帯電話番号")
                        Spacer()
                        TextField("09012345678", text: $telenumber)
                            .font(.subheadline)
                            .padding(12)
                            .background(Color(.systemGray6))
                    }
                    .padding(.horizontal)
                }
                Divider()
                Section{
                    Text("利用規約")
                        .font(.headline)
                        .foregroundStyle(.blue)
                    ScrollView{
                        TermsOfService(bunsho:termsPrivacyArray[0])
                    }
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .border(.cyan, width:0.5)
                }
                
                Section {
                    Text("「送信ボタンを押すことで、上記の利用規約に同意したものとみなします。")
                        .font(.caption)
                        .padding(.vertical)
                }
                
                Section{
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
                    
                    Button(action: {
                        isShowing2 = true
                    }){
                        Text("プライバシー")
                            .foregroundStyle(.black)
                            .frame(width: 300, height: 50)
                            .background(Color(.systemGroupedBackground))
                        
                    }
                    .fullScreenCover(isPresented: $isShowing2) {
                        Privacy(bunsho:termsPrivacyArray[0])
                    }
                    .background(Color(.systemGray6))
                    Spacer()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("利用開始・ログイン")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                }
            }
        }
    }
}
#Preview {
    LoginView()
}
