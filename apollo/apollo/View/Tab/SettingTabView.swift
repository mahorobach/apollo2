//
//  TabView3.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/06.
//

import SwiftUI

struct SettingTabView: View {
    @State private var isShowing = false
    @State private var isShowing2 = false
    @State var isShowAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section{
                        NavigationLink {
                            MyAccount()
                        } label: {
                            Text("登録情報変更")
                        }
                        
                    }
                    
                    Section{
                        Button(action: {
                            isShowing = true
                        }){
                            HStack{
                                Text("利用規約")
                                    .foregroundStyle(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 7, height: 12)
                                    
                            }
                        }
                        .fullScreenCover(isPresented: $isShowing) {
                            TermsOfService()
                        }
                        
                        Button(action: {
                            isShowing2 = true
                        }){
                            HStack {
                                Text("プライバシー")
                                    .foregroundStyle(.black)
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 7, height: 12)
                                
                            }
                        }
                        .fullScreenCover(isPresented: $isShowing2) {
                            Privacy()
                        }
                    }
//                    Section{
//                        NavigationLink {
//                            TermsOfService()
//                        } label: {
//                            Text("利用規約")
//                        }
//                        NavigationLink {
//                            Privacy()
//                        } label: {
//                            Text("プライバシーポリシー")
//                        }
//
//                    }
                    Section{
                        Text("アプリバージョン　　1.5.1J")
                    }
                    
                    Section{
                        Button("ログアウト"){
                            isShowAlert = true
                        }.alert("ログアウト", isPresented: $isShowAlert) {
                            Button("いいえ", role: .cancel) {
                            }
                            Button("はい", role: .destructive) {
                            }
                        } message: {
                            Text("ログアウトを行うと、この末端でのログイン情報は破棄され、再ログインにショートメールによる認証が新たに必要となります。\n \n尚、携帯電話番号の変更は本アプリ機能として未完成の為、将来新しい携帯電話番号での利用再開やアカウントデータ引き継ぎを検討される方は、ログアウトせずに、弊社へお問い合わせください。\n\nこの末端からログアウトしますか。")
                        }
                        .foregroundStyle(.red)
                    }
                    /*                VStack{
                     
                     NavigationLink(isActive: $isActive,
                     destination: {LoginViewController()},
                     label: {EmptyView()})
                     Button(action: {
                     do {
                     try Auth.auth().signOut()
                     isActive = true
                     } catch let signOutError as NSError {
                     print("Error signing out: %@", signOutError)
                     }
                     }, label: {
                     Text("LogOut")
                     Text("ログイン　ログアウト")
                     })
                     }
                     */
                    
                        .navigationBarBackButtonHidden(true)
                }
                .listStyle(.grouped)
            }
        }
        .accentColor(.blue)
    }
}

#Preview {
    SettingTabView()
}
