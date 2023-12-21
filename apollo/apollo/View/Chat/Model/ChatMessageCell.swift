//
//  ChatMessageCell.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/19.
//

import SwiftUI

struct ChatMessageCell: View {
         let isFromCurrentUser: Bool
        
    //    private var isFromCurrentUser: Bool {
    //        return message.isFromCurrentUser
    //    }
        var body: some View {
            HStack{
                if isFromCurrentUser {
                    Spacer()
    //                 Text(message.messageText)
                    Text("テストメッセージを送信しました。先日は、ありがとうございました。これからお世話になると思います。よろしくお願いいたします。")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemBlue))
                        .foregroundStyle(.white)
 //                       .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
                } else {
                    HStack(alignment: .bottom, spacing: 8){
    //                    CircularProfileImageView(user: User.MOC_USER, size: .xxSmall)
    //                    Text(message.messageText)
                        Text("メッセージを受け取りました。こちらこそ、良い機会に恵まれて本当に感謝しております。これから事業の発展の光が見えてきたようで、今からワクワクしております。")
                            .font(.subheadline)
                            .padding(12)
                            .background(Color(.systemGray5))
                            .foregroundStyle(.black)
 //                           .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                            .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                        
                        Spacer()
                        
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }

    #Preview {
        ChatMessageCell(isFromCurrentUser: true)
    }

