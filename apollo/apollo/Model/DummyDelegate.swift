//
//  DummyDelegate.swift
//  apollo
//
//  Created by 赤尾浩史 on 2024/08/17.
//

import SwiftUI
import KAPIF

class DummyDelegate2: KAPIDelegate{
    func kapiError(alert: KAPIF.KAPI.AlertText) {}
        func kapiMustUpdate() {
            
        }
        func kapiMustLogin() {}
        func kapiMustFinishRegister() {}
        func kapiBanned() {}
    
}
