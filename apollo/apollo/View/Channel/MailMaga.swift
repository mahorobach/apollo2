//
//  MailMaga.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI
/*
 public struct ChannelInfo : Identifiable {

     /// The stable identity of the entity associated with this instance.
     public let id: Data

     public let title: String

     public let naiyou: String

     public let isMidoku: Bool
 }
 */

struct MailMaga: View {
    @State private var isShowAlert = false
    @Environment(\.dismiss) var dismiss
    weak  var delegate: DummyDelegate?
    let alertText2 = ApolloApp().kapi.getTermsAndConditions()
    
    
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
                        Label("送信", systemImage: "tray.and.arrow.up")
                            .foregroundStyle(.gray)
                        
                    }.alert("", isPresented: $isShowAlert) {
                        Button("了解") {
                        }
                        
                    } message: {
  //                      Text("KAGURAはメルマガ痩身用アプリとなり、\n 意見交換、質問の受付は承っておりません。\n\n以前よりご意見やご質問の返信は\n控えていただくようお願いしておりましたが、\n現在も多数のメッセージ送信が続くため\n返信機能は停止しております。")
                        Text(alertText2)
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
