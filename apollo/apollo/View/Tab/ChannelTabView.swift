//
//  TabView1.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct ChannelTabView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    NavigationLink {
                        MailMaga()
                    } label: {
                        TitleRow()
                    }
                    NavigationLink {
                        Contact()
                    } label: {
                        TitleRow2()
                    }
                }
            }
        }
    }
}
#Preview {
    NavigationStack{
        ChannelTabView()
    }
}
