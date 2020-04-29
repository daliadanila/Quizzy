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
        
        let primaryButton   = app.buttons["startPlayingButton"]
        
        XCTAssert(primaryButton.exists)
        XCTAssertEqual(primaryButton.label, "START PLAYING")
    }
    
    func testInitialStateQuestionCard() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let primaryButton      = app.buttons["startPlayingButton"]
        
        primaryButton.tap()
        
        let questionCountLabel = app.staticTexts["1/10"]
        
        XCTAssert(questionCountLabel.exists)
        XCTAssertEqual(questionCountLabel.label, "1/10")
        
        let pointsCountLabel = app.staticTexts["0 Points"]
        
        XCTAssert(pointsCountLabel.exists)
        XCTAssertEqual(pointsCountLabel.label, "0 Points")
        
        let livesCountLabel = app.staticTexts["3 Lives"]
        
        XCTAssert(livesCountLabel.exists)
        XCTAssertEqual(livesCountLabel.label, "3 Lives")
        
        let categoryLabel = app.staticTexts["Category"]
        
        XCTAssert(categoryLabel.exists)
        XCTAssertEqual(categoryLabel.label, "Category")
        
        let questionLabel = app.staticTexts["Question"]
        
        XCTAssert(questionLabel.exists)
        XCTAssertEqual(questionLabel.label, "Question")
        
        let firstAnswerButton       = app.buttons["firstAnswerButton"]
        let secondAnswerButton      = app.buttons["secondAnswerButton"]
        let thirdAnswerButton      = app.buttons["thirdAnswerButton"]
        let forthAnswerButton      = app.buttons["forthAnswerButton"]
        
        XCTAssert(firstAnswerButton.exists)
        XCTAssert(secondAnswerButton.exists)
        XCTAssert(thirdAnswerButton.exists)
        XCTAssert(forthAnswerButton.exists)
        
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
