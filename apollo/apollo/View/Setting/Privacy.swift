//
//  SwiftUIView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI
import KAPIF

struct Privacy: View {
    @Environment(\.dismiss) var dismiss
    let bunsho:TermsAndPrivacyData
    let bunsho2 = KAPIF.version
 //   let bunsho2 = KAPIF.KAPI(delegate: <#T##any KAPIDelegate#>)
    
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
//                    let originalText = KAPIF_framework_zip.getPrivacyPolicy()
//                        .foregroundColor(.blue)
//                        .font(.system(size: 18))
                }
                
            }.padding()
        }
    }
}



#Preview {
    Privacy(bunsho:termsPrivacyArray[1])
}
