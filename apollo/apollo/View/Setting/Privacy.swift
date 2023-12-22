//
//  SwiftUIView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct Privacy: View {
    @Environment(\.dismiss) var dismiss
    let bunsho:TermsAndPrivacyData
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(bunsho.sentences)
                .fontWeight(.light)
                .font(.footnote)
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
                    Text("プライバシーポリシー")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                }
                
            }
        }
    }
}

#Preview {
    Privacy(bunsho:termsPrivacyArray[1])
}
