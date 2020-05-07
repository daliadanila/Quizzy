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
    
    @State private var firstPressed: Bool = false
    @State private var secondPressed: Bool = false
    @State private var thirdPressed: Bool = false
    @State private var forthPressed: Bool = false
    
    @State private var firstCorrect: Bool = false
    @State private var secondCorrect: Bool = false
    @State private var thirdCorrect: Bool = false
    @State private var forthCorrect: Bool = false
    
    @State private var answerSelected: Bool = false
    
    var currentIndex: Int
    
    var totalNumber: Int
    
    @Binding var nextIndex: Int
    
    var body: some View {
        
        func makeInfoVStack() -> some View {
            
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Text("Question \(self.currentIndex)/\(self.totalNumber)").style(.h6)
                    
                    Spacer()
                    
                }
                .padding(.top, 70)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                
                LottieView(filename: "Timer", stop: $answerSelected).frame(width: 70)
                
                Text("Category").style(.h7)
                
                Text("Question").style(.h2)
                
            }
        }
        
        func makeButtonsVStack() -> some View {
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    self.markSelectedAnswer(buttonIndex: 1)
                    
                    self.answerWasSelected()
                    
                    
                }, label: {
                    VStack {
                        Text("First answer").style(.h6) .accessibility(identifier: "firstAnswerButton")
                        
                    }.overlayStyle(isPressed: $firstPressed, isCorrect: $firstCorrect)
                })
                    .padding(.top, 10)
                
                Button(action: {
                    
                    self.markSelectedAnswer(buttonIndex: 2)
                    
                    self.answerWasSelected()
                    
                }, label: {
                    VStack {
                        Text("Second answer").style(.h6).accessibility(identifier: "secondAnswerButton")
                        
                    }.overlayStyle(isPressed: $secondPressed, isCorrect: $secondCorrect)
                })
                    .padding(.top, 10)
                
                
                Button(action: {
                    
                    self.markSelectedAnswer(buttonIndex: 3)
                    
                    self.answerWasSelected()
                    
                }, label: {
                    VStack {
                        Text("Third answer").style(.h6).accessibility(identifier: "thirdAnswerButton")
                        
                    }.overlayStyle(isPressed: $thirdPressed, isCorrect: $thirdCorrect)
                })
                    .padding(.top, 10)
                
                
                Button(action: {
                    
                    self.markSelectedAnswer(buttonIndex: 4)
                    
                    self.answerWasSelected()
                    
                }, label: {
                    VStack {
                        Text("Forth answer").style(.h6).accessibility(identifier: "forthAnswerButton")
                        
                    }.overlayStyle(isPressed: $forthPressed, isCorrect: $forthCorrect)
                })
                    .padding(.top, 10)
                
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
    
    func answerWasSelected() {
        
        self.answerSelected = true
        
        self.goToNextQuestion(delaySecs: 1)
    }
    
    func goToNextQuestion(delaySecs: Double) {
        
        delayWithSeconds(delaySecs) {
            
            self.secondCorrect = true
            
            delayWithSeconds(1) {
                
                withAnimation(.easeOut(duration: 1.0)) {
                    
                    if self.currentIndex == self.nextIndex {
                        
                        self.nextIndex += 1
                    }
                }
            }
            
        }
    }
    
    func markSelectedAnswer(buttonIndex: Int) {
        
        self.firstPressed = false
        
        self.secondPressed = false
        
        self.thirdPressed = false
        
        self.forthPressed = false
        
        switch buttonIndex {
        case 1:
            self.firstPressed.toggle()
        case 2:
            self.secondPressed.toggle()
        case 3:
            self.thirdPressed.toggle()
        case 4:
            self.forthPressed.toggle()
            
        default:
            self.firstPressed.toggle()
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
