//
//  TitleRow.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

/*
 public struct ChannelInfo : Identifiable {

     /// The stable identity of the entity associated with this instance.
     public let id: Data

     public let title: String

     public let naiyou: String

     public let isMidoku: Bool
 */

import SwiftUI

struct TitleRow: View {
    @StateObject var viewModel = ChannelModel()
    let title = Title()
    var body: some View {
        VStack{
            if viewModel.errorMessage != nil {
                Text("エラー")
            } else {
                List(viewModel.channelList) { channel in
                    VStack(alignment: .leading){
                        Text(" \(channel.title)")
                            .font(.headline)
                        Text("\(channel.naiyou)")
                            .font(.subheadline)
                        HStack{
                            if channel.isMidoku {
                                Text("未読あり")
                                    .foregroundColor(.red)
                            }
                            Spacer()
                            Text(title.titleArray[0].value)
                            
                        }
                    }
                }
            }
/*
            Text(title.titleArray[0].title).bold()
            Text(title.titleArray[0].subtitle)
            HStack{
                Text(title.titleArray[0].koudoku)
                Spacer()
                Text(title.titleArray[0].value)
 
            }
 */
        }
    }
}

#Preview {
    TitleRow()
}
