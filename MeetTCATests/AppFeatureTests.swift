//
//  AppFeatureTests.swift
//  MeetTCATests
//
//  Created by 김인환 on 9/14/24.
//

import ComposableArchitecture
import XCTest

@testable import MeetTCA

final class AppFeatureTests: XCTestCase {
    func testIncrementInFirstTab() async {
        let store = await TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
        }
    }
}
