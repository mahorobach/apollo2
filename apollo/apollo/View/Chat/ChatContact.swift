//
//  ContactChannel.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/17.
//

import SwiftUI

struct ChatContact: View {
    @EnvironmentObject var appState: ApolloAppState
    
    var body: some View {
        Text("Contact Channel")
    }
}

#Preview {
    ChatContact()
}
