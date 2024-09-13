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
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: MeetTCAApp.store)
        }
    }
}
