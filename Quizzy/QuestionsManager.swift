//
//  QuestionsManager.swift
//  Quizzy
//
//  Created by Dalia on 07/05/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

class QuestionsManager {

    let fileHandler: FileHandler
    
    let filename: String
    
    init(fileHandler: FileHandler, filename: String) {
        
        self.fileHandler = fileHandler
        
        self.filename = filename
    }

    func handle() throws {

        let data = try fileHandler.readData(filename: filename)
    }
}

class FileHandler {

    func readData(filename: String) throws -> [String: Dictionary<String, AnyObject>] {
        
        let plistPath = try retrievePlistPath(filename: filename)
        
        let plistXML = try retrieveXMLContent(path: plistPath)
        
        let plistData = try retrievePropertyList(xmlData: plistXML)
        
        return plistData
    }
    
    func retrievePlistPath(filename: String) throws -> String {
        
        guard let plistPath = Bundle.main.path(forResource: filename, ofType: "plist") else {
            
            throw ParsingError.fileNotFound
        }
        
        return plistPath
    }
    
    func retrieveXMLContent(path: String) throws -> Data {
        
        guard let plistXML = FileManager.default.contents(atPath: path) else {
            
            throw ParsingError.fileNotFound
        }
        
        return plistXML
    }
    
    func retrievePropertyList(xmlData: Data) throws -> [String: Dictionary<String, AnyObject>] {
        
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
        
        guard let plistData = try? (PropertyListSerialization.propertyList(from: xmlData, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String: Dictionary<String, AnyObject>]) else
        {
            throw ParsingError.serializationError
        }
        
        return plistData
    }
}

enum ParsingError: Error {
    
    case fileNotFound
    
    case serializationError
}
