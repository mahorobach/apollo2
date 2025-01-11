//
//  ChatList.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/07.
//

import SwiftUI


struct ChatList: View {
    @EnvironmentObject var appState: ApolloAppState
    var body: some View {
        Text("Chat List")
    }
}

#Preview {
    ChatList()
}
