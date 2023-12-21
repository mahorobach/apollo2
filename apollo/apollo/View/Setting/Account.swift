//
//  Account.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/17.
//

import SwiftUI


struct Account: View {
    @State var isShow: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let grids = [
        GridItem(.fixed(150),spacing:  10, alignment: .leading),
        GridItem(.fixed(150),spacing:  10, alignment: .leading),
        GridItem(.fixed(50),spacing:  10, alignment: .trailing),
    ]
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    Text("チャンネル配信者とのチャットに使用される氏名と、連絡用のメールアドレスを変更できます。")
                        .listRowBackground(Color(.systemGray5))
                    LazyVGrid(columns: grids){
                        Text("氏名")
                        Text("akao hiroshi")
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .listRowBackground(Color(.systemGray5))
                    
                    LazyVGrid(columns: grids){
                        Text("メールアドレス")
                        Text("test@gmail.com")
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .listRowBackground(Color(.systemGray5))
                    
                    VStack {
                        Button {
                            isShow = true
                        } label: {
                            Text("変更")
                                .font(.headline)
                                .frame(width: 360, height: 48)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        
                    }
                    
                }
                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Text("戻る")
                        }
                        .foregroundStyle(.blue)
                    }
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

#Preview {
    Account()
}
