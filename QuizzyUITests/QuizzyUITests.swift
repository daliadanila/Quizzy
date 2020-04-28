//
//  QuizzyUITests.swift
//  QuizzyUITests
//
//  Created by Dalia on 27/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import XCTest

class QuizzyUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
    }
    
    func testGetStartedScreen() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let primaryButton      = app.buttons["startPlayingButton"]
        
        let secondaryButton = app.buttons["howToPlayButton"]
        
        XCTAssert(primaryButton.exists)
        XCTAssertEqual(primaryButton.label, "START PLAYING")
        
        XCTAssert(secondaryButton.exists)
        XCTAssertEqual(secondaryButton.label, "How to play ?")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
