//
//  MailMaga.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct MailMaga: View {
    @State private var isShowAlert = false
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(mailmagaArray){
                        MailMagaData in
                        MailMagaRowView(mailmaga: MailMagaData)
                        
                    }
                    Divider()
                        .frame(height: 10)
                        .foregroundStyle(.blue)
                }
               
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.white,for: .navigationBar)
            .toolbarBackground(Color.white,for: .tabBar)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("戻る"){
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
                ToolbarItem(placement: .principal) {
                    Text("イシキカイカク.com")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button(action: {
                        isShowAlert = true
                    }) {
                        Label("送信", systemImage: "pipeline")
                            .foregroundStyle(.gray)
                        
                    }.alert("", isPresented: $isShowAlert) {
                        Button("了解") {
                        }
                        
                    } message: {
                        Text("KAGURAはメルマガ痩身用アプリとなり、\n 意見交換、質問の受付は承っておりません。\n\n以前よりご意見やご質問の返信は\n控えていただくようお願いしておりましたが、\n現在も多数のメッセージ送信が続くため\n返信機能は停止しております。")
                    }
                }
            }
            .background(Color.white)
        }
    }
}


#Preview {
    MailMaga()
}
