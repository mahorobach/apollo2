//
//  TopView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct TopView: View {
    @AppStorage("current_user") var user = ""
    enum Tabs: String {
        case tab1 = "チャンネル一覧"
        case tab2 = "チャット一覧"
        case tab3 = "設定"
    }
    @State private var navigationTitle: String = Tabs.tab1.rawValue
    @State private var selectedTab: Tabs = .tab1
    
    init(){
        UITabBar.appearance().backgroundColor = .white.withAlphaComponent(0.4)
    }
    
       
    var body: some View {
        NavigationStack{
            Menu(navigationTitle){
            }
            TabView(selection: $selectedTab){
                ChannelTabView().tabItem {  Image(systemName: "dot.radiowaves.left.and.right")
                    Text(Tabs.tab1.rawValue)
                }
                .tag(Tabs.tab1)
                
                ChatTabView().tabItem {  Image(systemName: "message")
                    Text(Tabs.tab2.rawValue)
                }
                .tag(Tabs.tab2)
                
                SettingTabView().tabItem {  Image(systemName: "gearshape")
                    Text(Tabs.tab3.rawValue)
                }
                .tag(Tabs.tab3)
            }
            
            .navigationBarBackButtonHidden(true)
            .onChange(of: selectedTab) {navigationTitle = selectedTab.rawValue}
            
        }
    }
}


#Preview {
    TopView()
}
