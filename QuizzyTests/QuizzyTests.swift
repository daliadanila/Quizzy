//
//  QuizzyTests.swift
//  QuizzyTests
//
//  Created by Dalia on 27/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import XCTest
@testable import Quizzy

class QuizzyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testQuestionsFileHasContent() throws {
       
        let fileHandler = FileHandler()
        
        let data = fileHandler.readData(filename: "Questions")
        
        XCTAssertNotNil(fileHandler)
        
        XCTAssertNotNil(data)
        
    }
    
    func testQuestionsFileHasExpectedStructure() throws {
        
        let fileHandler = FileHandler()
        
        let data = fileHandler.readData(filename: "Questions") as [String: Dictionary<String, AnyObject>]
    
        XCTAssertNotNil(data.keys)
        
        for question in data {
            
            let questionDict = question.value
            
            let allKeys = questionDict.keys
            
            XCTAssertTrue(allKeys.contains("Category"))
            
            XCTAssertTrue(allKeys.contains("Answers"))
            
            XCTAssertTrue(allKeys.contains("Question"))
            
            XCTAssertTrue(allKeys.contains("Correct answer index"))
            
            let allAnswers = questionDict["Answers"] as! Array<AnyObject>
            
            XCTAssertNotNil(allAnswers)
            
            XCTAssertTrue(allAnswers.count == 4)
        }
        
    }
}
