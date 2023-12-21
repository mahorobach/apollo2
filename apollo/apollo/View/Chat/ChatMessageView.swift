//
//  ChatMessageView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/17.
//

import SwiftUI

struct ChatMessageView: View {
    @State private var messangeText = ""
    var body: some View {
        VStack {
            ScrollView{
                //header
                
                //messages
                
                LazyVStack{
//                    ForEach(viewModel.messages) { message in
//                        ChatMessageCell(message: message)
//                    }
                    ForEach(0...15, id:\.self){ message in
                        ChatMessageCell(isFromCurrentUser: Bool.random())
                    }
                }
                
                
            }
            //message input view
            Spacer()
            ZStack(alignment: .trailing){
//                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                TextField("Message...", text: $messangeText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
 //                   viewModel.sendMessage()
  //                  viewModel.messageText = ""
                    print("Send message")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                
            }
            .padding()
        }
        .navigationTitle(User.MOC_USER.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatMessageView()
}
