//
//  QuestionsManager.swift
//  Quizzy
//
//  Created by Dalia on 07/05/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Combine



class BaseQuestionRepository  {
 
  @Published var questions = [QuestionInfo]()
}

protocol QuestionRepository : BaseQuestionRepository {
    
    func loadData()
}


class LocalQuestionRepository : BaseQuestionRepository, QuestionRepository, ObservableObject {

    let fileHandler: FileHandler
    
    let filename: String
    
    init(fileHandler: FileHandler = FileHandler(), filename: String) {
        
        self.fileHandler = fileHandler
        
        self.filename = filename
        
        super.init()
        
        self.loadData()
    }

    func loadData() {
        
        if let data = try? fileHandler.readData(filename: filename) {
            
            self.questions = Array(data.values)
        }
    }
}

class FileHandler {

    func readData(filename: String) throws -> [String: QuestionInfo] {
        
        let plistURL = try retrievePlistURL(filename: filename)
        
        let plistData = try retrievePlistData(plistURL: plistURL)
        
        let plistContent = try retrievePlistContent(plistData: plistData)
        
        return plistContent
    }
    
    func retrievePlistURL(filename: String) throws -> URL {
        
        guard let plistURL = Bundle.main.url(forResource: filename, withExtension: "plist") else {
            
            throw ParsingError.fileNotFound
        }
        
        return plistURL
    }
    
    func retrievePlistData(plistURL: URL) throws -> Data {
        
        let plistData = try Data(contentsOf: plistURL)
        
        return plistData
    }
    
    func retrievePlistContent(plistData: Data) throws -> [String: QuestionInfo] {
               
        let decoder = PropertyListDecoder()
               
        return try decoder.decode([String: QuestionInfo].self, from: plistData)
    }
}

enum ParsingError: Error {
    
    case fileNotFound
    
    case serializationError
}

struct QuestionInfo: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id, category, question, answers, correct
    }
    
    let id: String
    let category: String
    let question: String
    let answers: [String]
    let correct: Int
}
