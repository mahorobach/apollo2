//
//  ChannelListView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/11/13.
//

import SwiftUI


struct ChannelListView: View {
    @EnvironmentObject var appState: ApolloAppState
    @StateObject var viewModel = ChannelModel(appState: ApolloAppState())
  
     var body: some View {
         
        NavigationStack {
            VStack {
                if viewModel.errorMessage != nil {
                    Text("エラー")
                        .foregroundColor(.red)
                                                .padding()
                                        } else {
                                            List(viewModel.channelList) { channel in
                                                NavigationLink( destination:ChannelMessageView(channelID: channel.id,            channelTitle: channel.title)){
                                                    VStack(alignment: .leading) {
                                                        Text(" \(channel.title)")
                                                            .font(.headline)
                                                        Text(" \(channel.naiyou)")
                                                            .font(.subheadline)
                                                        if channel.isMidoku {
                                                            Text("未読ありです")
                                                                .foregroundColor(.red)
                                                        }
                                                        HStack{
                                                            Text("購読中よ")
                                                            Spacer()
                                                            Text("無料")
                                                                .font(.subheadline)
                                                        }
                                                    }
                                                    .padding()
                                                }
                                            }
                                        }
                
                                    }
        //                            .navigationTitle("チャンネルリスト")
                                    .onAppear {
                                        
                                        viewModel.getChannelList()  //
     
                                    }
                                }
                            }
                        }

/*
#Preview {
    ChannelListView()
}
*/
