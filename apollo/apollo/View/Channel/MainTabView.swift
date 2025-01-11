//
//  MainTabView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/15.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: ApolloAppState
    @State private var selectTab = 0
//    let appState: ApolloAppState
    enum Tabs: String {
        case tab1 = "チャンネル一覧"
        case tab2 = "チャット一覧"
        case tab3 = "設定"
    }
    @State private var navigationTitle: String = Tabs.tab1.rawValue
    @State private var selectedTab: Tabs = .tab1
    
    var body: some View {
        NavigationStack{
            Menu(navigationTitle){
            }
            TabView (selection: $selectedTab){
                ChannelListView()
                    .environmentObject(appState) 
                    .tabItem {
                        VStack{
                            Image(systemName: "dot.radiowaves.left.and.right")
                                .environment(\.symbolVariants, selectedTab == Tabs.tab1 ? .fill : .none)
                            Text(Tabs.tab1.rawValue)
                        }
                    }
                    .onAppear{
                        selectedTab = Tabs.tab1
             
                    }
                    
                    .tag(Tabs.tab1)
                    
                ChatTabView()
                    .tabItem {
                        VStack{
                            Image(systemName: "message")
                                .environment(\.symbolVariants, selectedTab == Tabs.tab2 ? .fill : .none)
                            Text(Tabs.tab2.rawValue)
                        }
                    }
                    .onAppear{
                        selectedTab = Tabs.tab2
                        
                    }
                    
                
                    .tag(Tabs.tab2)
                
                SettingTabView()
                    .tabItem {
                        VStack{
                            Image(systemName: "gearshape")
                                .environment(\.symbolVariants, selectedTab == Tabs.tab3 ? .fill : .none)
                            Text(Tabs.tab3.rawValue)
                        }
                    }
                    .onAppear{
                        selectedTab = Tabs.tab3
                        
                    }
                    
                    .tag(Tabs.tab3)
                
            }
            .onChange(of: selectedTab) {navigationTitle = selectedTab.rawValue }
            .onAppear {
                
            }
        }
        
    }
}
/*
#Preview {
    MainTabView()
}
*/
