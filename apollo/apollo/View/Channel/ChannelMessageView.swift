//
//  ChannelMessageView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/11/21.
//

import SwiftUI

struct ChannelMessageView: View {
    @StateObject var viewModel = ChannelMessageModel()
    let channelID: Data
    let channelTitle: String
    let kapi = ApolloApp().kapi
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text("エラー：　\(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                List(viewModel.messages) { message in
                    VStack(alignment: .leading){
                        Text(message.koukaiDate, formatter: DateFormatter.shortDate)
                            .font(.headline)
                        Text(message.naiyou)
                    }
                }
                
            }
        }
        .navigationTitle(channelTitle)
        .onAppear {
            viewModel.fetchMessages(for: channelID)
            let sessionInfo = kapi.getSessionInfo()
            print("セッション情報: \(sessionInfo)")
        }
    }
}

extension DateFormatter {
    static var shortDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
}
