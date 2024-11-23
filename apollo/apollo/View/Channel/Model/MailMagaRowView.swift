//
//  MailMagaView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/13.
//


/*
 public struct ChannelInfo : Identifiable {

     /// The stable identity of the entity associated with this instance.
     public let id: Data

     public let title: String

     public let naiyou: String

     public let isMidoku: Bool
 }
 
 */
import SwiftUI

struct MailMagaRowView: View {
    var mailmaga:MailMagaData
    var body: some View {
        ScrollView {
            VStack{
                Text(mailmaga.date)
                Section{
                    Text(mailmaga.bunsho)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .frame(width: 330)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
            }
        }
    }
}

#Preview {
    MailMagaRowView(mailmaga: mailmagaArray[0])
}
