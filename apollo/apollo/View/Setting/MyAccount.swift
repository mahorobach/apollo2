//
//  MyAccount.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct MyAccount: View {
    @EnvironmentObject var appState: ApolloAppState
    @State var isShow: Bool = false
    @State private var fullname = "赤尾浩史"
    @State private var email = "akao@gmail.com"
    @Environment(\.dismiss) var dismiss
    
    let grids = [
        GridItem(.fixed(150),spacing:  10, alignment: .leading),
        GridItem(.fixed(180),spacing:  10, alignment: .leading),

    ]
    
    var user = [User]()
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    Text("チャンネル配信者とのチャットに使用される氏名と、連絡用のメールアドレスを変更できます。")
                        .listRowBackground(Color(.systemGray5))
                    LazyVGrid(columns: grids){
                        Text("氏名")
                        TextField("例 山田太郎", text: $fullname)
                            .modifier(TextFieldClearButton(text: $fullname))
                            .frame(width: 180)

                    }
                    .listRowBackground(Color(.systemGray5))
                    
                    LazyVGrid(columns: grids){
                        Text("メールアドレス")
                        TextField("test＠gmail.com", text: $email)
                            .keyboardType(.asciiCapable)
                            .autocapitalization(.none)
                            .modifier(TextFieldClearButton(text: $email))
                            .frame(width: 180)

                        
                    }
                    .listRowBackground(Color(.systemGray5))
                    
                    VStack {
                        Button("変更") {
                            isShow = true
                        }
                        .font(.headline)
                        .frame(width: 360, height: 48)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .alert(isPresented: $isShow) {
                            Alert(title: Text("入力確認"), message: Text("登録情報を下記の通り設定します。\n氏名　　\(fullname)　\n メールアドレス　\(email)"),
                                  primaryButton: .default(Text("OK"), action: {
                                okAction()
                            }),
                                  secondaryButton: .cancel(Text("キャンセル"), action:{})
                            )}
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("< 戻る"){
                        dismiss()
                    }
                    .foregroundStyle(.blue)
                }
                ToolbarItem(placement: .principal) {
                    Text("登録情報変更")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                }
            }
        }
        
    }
}
struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button(
                    action: {
                        self.text = ""
                    }
                ){
                    Image(systemName: "x.circle.fill")
                     .foregroundColor(.gray)
                }
            }
        }
    }
}

func okAction(){
    print("ok ボタンが選ばれた")
}

#Preview {
    MyAccount()
}
