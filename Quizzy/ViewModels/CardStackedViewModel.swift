//
//  CardStackedViewModel.swift
//  Quizzy
//
//  Created by Dalia on 11/05/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Combine
import Resolver

class CardStackedViewModel: ObservableObject {
    
    @Published var questionRepository: QuestionRepository = Resolver.resolve()
    
    @Published var cardViewModels = [CardViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        questionRepository.$questions.map { questions in
            questions.map { question in
                CardViewModel(question: question, totalCount: questions.count)
            }
        }
        .assign(to: \.cardViewModels, on: self)
        .store(in: &cancellables)
    }
}
