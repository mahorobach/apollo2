//
//  ChatRow.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/18.
//

import SwiftUI

struct ChatRow2: View {
    let chattitle = ChatTitle()
    var body: some View {
        VStack(alignment: .leading) {
            Text(chattitle.chattitleArray[1].pagetitle).bold()
            HStack{
                Text(chattitle.chattitleArray[1].from ? "管理者：" : "あなた：")
                Text(chattitle.chattitleArray[1].submessage)
            }
            HStack{
                Spacer();  Text(chattitle.chattitleArray[1].timestamp)
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    ChatRow2()
}
