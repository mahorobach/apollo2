//
//  Contact.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct Contact: View {
    @State private var isShowAlert = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            HStack{
                ScrollView(.horizontal){
                    
                }
                .frame(height: 500)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("戻る"){
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
                ToolbarItem(placement: .principal) {
                    Text("お問い合わせチャンネル")
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
                        Text("こちらの窓口は、アプリ自体に関するお問い合わせのみ、\n 承っております（不具合報告や技術的なご相談など）。\n\nイシキカイカクや参政党などへのお問い合わせは、\n該当するWEBサイトのお問い合わせ窓口より、お願いします。")
                    }
                }
            }
         }
    }
}

#Preview {
    Contact()
}
