//
//  CardContainerView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct CardContainerView: View {
    
   @State private var cards = [Card](repeating: Card.example, count: 3)
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(FlatMagenta()), Color(FlatPlumDark())]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: self.cards[index])
                            .stacked(at: index, in: self.cards.count)
                    }
                }
            }
        }
        
    }
}

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        return Card(prompt: "Who was the first to break the sound barrier?", answer: "Chuck Yeager")
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView()
    }
}
