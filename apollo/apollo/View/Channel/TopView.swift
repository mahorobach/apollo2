//
//  TopView.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//
/*
import SwiftUI
//import KAPIF

struct TopView: View {
    @AppStorage("current_user") var user = ""
    enum Tabs: String {
        case tab1 = "チャンネル一覧"
        case tab2 = "チャット一覧2"
        case tab3 = "設定2"
    }
    @State private var navigationTitle: String = Tabs.tab1.rawValue
    @State private var selectedTab: Tabs = .tab1
    
    init(){
        UITabBar.appearance().backgroundColor = .white.withAlphaComponent(0.4)
    }
    @EnvironmentObject var appState: ApolloAppState
 //   let kapi = AppState().kapi
//    let channelInfo = KAPIF.KAPI.ChannelInfo.self
    
    var body: some View {
        NavigationStack{
            Menu(navigationTitle){
            }
            TabView(selection: $selectedTab){
                ChannelListView(viewModel: ChannelModel(appState: ApolloAppState)).tabItem {  Image(systemName: "dot.radiowaves.left.and.right")
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
    /*
    func channelList() {
        kapi.getChannelList { result in
            switch result {
                case .okChannelList([KAPIF.KAPI.ChannelInfo])            }
        }
        kapi.register(keitai: phonenumber) { result in
            switch result {
            case .okData(let data) :
                /*
                self.uid = data
                self.showing = true
                */
                if data.isEmpty {
                                self.errorMessage = "UIDデータが空です。"
                                print("エラー: UIDデータが空")
                                return
                            }
                            self.uid = data
                            print("取得したUID: \(self.uid?.description ?? "なし")")
                            self.showing = true
            case .errorAlert(let alertText):
                if let alert = alertText {
                    self.errorMessage = alert.title  + alert.msg
                    print("エラー: \(self.errorMessage!)")
                }
            default :
                self.errorMessage = "エラー発生"
                print("エラー: \(self.errorMessage!)")
            }
        }
    }
     */
}


 #Preview {
 TopView()
 }
 
*/
