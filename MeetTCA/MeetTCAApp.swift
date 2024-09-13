//
//  MeetTCAApp.swift
//  MeetTCA
//
//  Created by 김인환 on 9/10/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct MeetTCAApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: MyApp.store)
        }
    }
}
