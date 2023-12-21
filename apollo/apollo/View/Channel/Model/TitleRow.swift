//
//  TitleRow.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct TitleRow: View {
    let title = Title()
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.titleArray[0].title).bold()
            Text(title.titleArray[0].subtitle)
            HStack{
                Text(title.titleArray[0].koudoku)
                Spacer()
                Text(title.titleArray[0].value)
            }
        }
    }
}

#Preview {
    TitleRow()
}
