//
//  CardView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct CardView: View {

    @State private var correctAnswerIndex: Int = -1
    @State private var tappedAnswerIndex: Int = -1
    
    @State private var stopTimer: Bool = false
    
    @ObservedObject var cardVM: CardViewModel
    
    var currentIndex: Int
    
    @Binding var nextIndex: Int
    
    var body: some View {
        
        func makeInfoVStack() -> some View {
            
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Text("Question \(self.currentIndex + 1)/\(self.cardVM.totalCount)")
                        .style(.h6)
                        .accessibility(identifier: "questionCount")
                    
                    Spacer()
                    
                }
                .padding(.top, 70)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                
                LottieView(filename: "Timer", stop: $stopTimer).frame(width: 70)
                
                Text("\(cardVM.question.category)")
                    .style(.h7)
                    .accessibility(identifier: "questionCategory")
                
                Text("\(cardVM.question.question)")
                    .style(.h2)
                    .accessibility(identifier: "questionText")
                
            }
        }
        
        func makeButtonsVStack() -> some View {
            
            VStack {
                
                Spacer()
                
                ForEach (0..<4) { i in
                    
                    Button(action: {
                        
                        self.tappedAnswerIndex = i
                        
                        self.stopTimer = true
                        
                        self.goToNextQuestion(delaySecs: 1)
                        
                        
                    }, label: {
                        VStack {
                            Text("\(self.cardVM.question.answers[i])").style(.h6) .accessibility(identifier: "answerButton\(i)")
                            
                        }.overlayStyle(isPressed: i == self.tappedAnswerIndex, isCorrect: i == self.correctAnswerIndex)
                    })
                        .padding(.top, 10)
                }
                
                Spacer()
            }
        }
        
        func makeCardView() -> some View {
            
            ZStack(alignment: .topLeading) {
                
                Rectangle().fill(Color.white).cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8).stroke(Color(FlatGray()), lineWidth: 4)
                )
                    .padding()
                    .padding(.top, 30)
                    .padding(.bottom, 50)
                
                
                VStack {
                    
                    makeInfoVStack()
                    
                    makeButtonsVStack()
                }
            }
        }
        
        return makeCardView()
            
            .onAppear {
                
                self.goToNextQuestion(delaySecs: 10)
        }
        
    }

    func goToNextQuestion(delaySecs: Double) {
        
        delayWithSeconds(delaySecs) {
            
            self.correctAnswerIndex = self.cardVM.question.correct
            
            delayWithSeconds(1) {
                
                withAnimation(.easeOut(duration: 1.0)) {
                    
                    if self.currentIndex == self.nextIndex {
                        
                        self.nextIndex += 1
                    }
                }
            }
            
        }
    }
}
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(questionIndex: 1)
//            .background(Color.gray)
//    }
//}
