//
//  CommunityEventsUITests.swift
//  CommunityEventsUITests
//
//  Created by Jasmine Patel on 09/06/2022.
//

import XCTest
@testable import CommunityEvents

class CommunityEventsUITests: XCTestCase {
    var app: XCUIApplication!
    var sut: CommunityEventsApp!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testAssertWelcomeViewIsDisplayedAndNavigatesToMapViewOnButtonPress() {
        let welcomeTitle = app.staticTexts["Discover community events near you"]
        let exploreButton = XCUIApplication().buttons["Explore"]
        let mapViewLabel = app.staticTexts["Events Near You"]
        
        XCTAssertTrue(welcomeTitle.exists)
        XCTAssertTrue(exploreButton.exists)
        
        exploreButton.tap()
        
        if exploreButton.isSelected {
            XCTAssertTrue(mapViewLabel.exists)
        }
    }
    
    func testSelectingSubmitNavigationButtonNavigatesToEventSubmissionView() {
        let submitNavigationButton = app.tabBars.buttons["Submit Event"]
        let submissionViewTitle = app.staticTexts["Event Submissions"]
        
        XCTAssertTrue(submitNavigationButton.exists)
        
        submitNavigationButton.tap()
                
        if submitNavigationButton.isSelected {
            XCTAssertTrue(submissionViewTitle.exists)
        }
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
