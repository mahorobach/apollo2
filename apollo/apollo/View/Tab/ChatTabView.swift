//
//  TabView2.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct ChatTabView: View {
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    NavigationLink {
                        ChatMessageView()
                    } label: {
                        ChatRow()
                    }
                    NavigationLink {
                        ChatContact()
                    } label: {
                        ChatRow2()
                    }
                }
            }
        }
    }
}

#Preview {
    ChatTabView()
}
