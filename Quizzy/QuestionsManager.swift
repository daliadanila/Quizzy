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

    func handle() {

        let data = fileHandler.readData(filename: filename)
    }
}

class FileHandler {

    func readData(filename: String) -> [String: Dictionary<String, AnyObject>] {
        
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
        
        var plistData: [String: Dictionary<String, AnyObject>] = [:]
        
        let plistPath: String? = Bundle.main.path(forResource: filename, ofType: "plist")!
        
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        
        do {
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String:Dictionary<String, AnyObject>]

        } catch {
            print("Error reading plist: \(error), format: \(propertyListFormat)")
        }
        
        return plistData
    }
}
