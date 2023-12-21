//
//  Verification.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/19.
//

import SwiftUI

struct Verification: View {
    @State private var ninsho = ""
    @State private var showing = false
    var body: some View {
        NavigationStack{
 
            VStack{
                Text("入力された携帯電話番号宛に送信されたショートメール(SMS)に記載された認証コードを下記にご入力ください")
                    .padding()
                Divider()
                HStack{
                    Text("認証コード")
                    TextField("", text: $ninsho, axis: .vertical)
                        .padding(12)
                        .padding(.trailing, 48)
                }
                .padding(.horizontal)
                Divider()
                Button(action: {
                    showing = true
                }){
                    Text("送信")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 50)
                        .background(Color(.systemCyan))
                }
                .padding()
                .fullScreenCover(isPresented: $showing) {
                    TopView()
                }
                Text("10分経ってもショートメールが届かない場合は、お手数ですが前の画面に戻って、再度お試しください")
                    .padding(.horizontal)
                Spacer()
            }
//            .background(Color(.systemGroupedBackground))
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
    }
    
}

#Preview {
    Verification()
}
