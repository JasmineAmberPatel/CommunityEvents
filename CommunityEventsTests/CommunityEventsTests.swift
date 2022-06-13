//
//  CommunityEventsTests.swift
//  CommunityEventsTests
//
//  Created by Jasmine Patel on 09/06/2022.
//

import XCTest
@testable import CommunityEvents

class CommunityEventsTests: XCTestCase {
    
    var sut: CommunityEventsApp!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CommunityEventsApp()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
}
