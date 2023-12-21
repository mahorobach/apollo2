//
//  ChatRow.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/15.
//

import SwiftUI

struct ChatRow: View {
    let chattitle = ChatTitle()
    var body: some View {
        VStack(alignment: .leading) {
            Text(chattitle.chattitleArray[0].pagetitle).bold()
            HStack{
                Text(chattitle.chattitleArray[0].from ? "管理者：" : "あなた：")
                Text(chattitle.chattitleArray[0].submessage)
            }
            HStack{
                Spacer();  Text(chattitle.chattitleArray[0].timestamp)
                    .foregroundStyle(.blue)
            }
            
        }
    }
}

#Preview {
    ChatRow()
}
