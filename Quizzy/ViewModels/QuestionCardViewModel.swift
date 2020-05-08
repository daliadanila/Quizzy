//
//  QuestionCardViewModel.swift
//  Quizzy
//
//  Created by Dalia on 08/05/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Combine
import Resolver

class QuestionCardViewModel: ObservableObject {
    
    @Published var questionRepository: QuestionRepository = Resolver.resolve()
    
    @Published var question: QuestionInfo
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
      questionRepository.$questions.map { questions in
        questions.map { question in
            self.question = question
        }
      }
//      .store(in: &cancellables)
    }
}
