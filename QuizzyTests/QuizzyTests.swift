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
        
        let data = try fileHandler.readData(filename: "Questions")
        
        XCTAssertNotNil(fileHandler)
        
        XCTAssertNotNil(data)
        
    }
    
    func testQuestionsFileHasExpectedStructure() throws {
        
        let fileHandler = FileHandler()
        
        let data = try fileHandler.readData(filename: "Questions") as [String: QuestionInfo]
    
        XCTAssertNotNil(data)
        
        XCTAssertNotNil(data.values)
        
        for question in data {
            
            let questionDict = question.value
            
            XCTAssertTrue(!questionDict.category.isEmpty)
            
            XCTAssertTrue(!questionDict.question.isEmpty)
            
            XCTAssertTrue(!String(questionDict.correct).isEmpty)
            
            XCTAssertTrue(questionDict.answers.count == 4)
        }
        
    }
    
    func testRetrievePlistURL() {
        
        let fileHandler = FileHandler()
        
        XCTAssertThrowsError(try fileHandler.retrievePlistURL(filename: "Hello")) { error in
            XCTAssertEqual(error as? ParsingError, ParsingError.fileNotFound)
        }
    }
    
    func testRetrievePlistData() {
        
        let fileHandler = FileHandler()
        
        XCTAssertThrowsError(try fileHandler.retrievePlistData(plistURL: URL(fileURLWithPath: "Hello"))) { error in
            XCTAssertEqual(error as? ParsingError, nil)
        }
    }
    
    func testRetrievePlistContent() {
        
        let fileHandler = FileHandler()
        
        XCTAssertThrowsError(try fileHandler.retrievePlistContent(plistData: Data([1]))) { error in
            XCTAssertEqual(error as? ParsingError, nil)
        }
    }
}
