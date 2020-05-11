//
//  CardViewModel.swift
//  Quizzy
//
//  Created by Dalia on 08/05/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Combine
import Resolver


class CardViewModel: ObservableObject, Identifiable  {
    
    @Injected var questionRepository: QuestionRepository
    
    @Published var question: QuestionInfo
    
    @Published var totalCount: Int
    
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(question: QuestionInfo, totalCount: Int) {
        
        self.question = question
        
        self.totalCount = totalCount
        
        $question
        .compactMap { $0.id }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
        
    }
    
}

