//
//  TermsOfService.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI
//import KAPIF

struct TermsOfService: View {
    @Environment(\.dismiss) var dismiss
    
    var description: String = ""
    
    let termsAndConditions = ApolloApp().kapi.getTermsAndConditions()
 
    var body: some View {
        NavigationStack{
            ScrollView {
                Text(termsAndConditions)
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
                    Text("利用規約")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                }
            }
            .padding()
        }
    }
}
#Preview {
    TermsOfService()
}
