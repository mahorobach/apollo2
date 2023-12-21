//
//  TitleRow2.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct TitleRow2: View {
    let title = Title()
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.titleArray[1].title).bold()
            Text(title.titleArray[1].subtitle)
            HStack{
                Text(title.titleArray[1].koudoku)
                Spacer()
                Text(title.titleArray[1].value)
            }
        }
    }
}

#Preview {
    TitleRow2()
}
