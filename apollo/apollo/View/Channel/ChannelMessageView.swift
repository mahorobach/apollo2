//
//  ChannelMessageView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/11/21.
//

import SwiftUI

struct ChannelMessageView: View {
    @EnvironmentObject var appState: ApolloAppState
    @StateObject var viewModel = ChannelModel(appState: ApolloAppState())
    let channelID: Data
    let channelTitle: String
  
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
            viewModel.getChannelMessaage(channelID: channelID)
   
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
