//
//  PrivacyTest.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/03/29.
//

import SwiftUI
import KAPIF

struct PrivacyTest: View {
    let bunsho = KAPI.version
    var body: some View {
        Text(String(bunsho))
    }
}

#Preview {
    PrivacyTest()
}
