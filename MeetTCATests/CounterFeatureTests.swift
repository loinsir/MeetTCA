//
//  CounterFeatureTests.swift
//  MeetTCATests
//
//  Created by 김인환 on 9/14/24.
//

import ComposableArchitecture
import XCTest

@testable import MeetTCA

final class CounterFeatureTests: XCTestCase {
    func testCounter() async {
        let clock = TestClock()
        
        let store = await TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.continuousClock = clock
        }
        
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = true
        }
        
        await clock.advance(by: .seconds(1))
        await store.receive(\.timerTick) {
            $0.count = 1
        }
        
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = false
        }
    }
    
    func testNumberFact() async {
        let store = await TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.numberFact.fetch = { _ in "0 is a good number." }
        }
        
        await store.send(.factButtonTapped) {
            $0.isLoading = true
        }
        
        await store.receive(\.factResponse) {
            $0.isLoading = false
            $0.fact = "0 is a good number."
        }
    }
}
