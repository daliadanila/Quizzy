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
        
        ZStack(alignment: .topLeading) {
            Rectangle().fill(Color.white).cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(FlatGray()), lineWidth: 4)
                )
                .padding()
                .padding(.top, 30)
                .padding(.bottom, 50)
            
            
            VStack {
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("Question \(self.currentIndex)/\(self.totalNumber)")
                            .font(.callout)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                    }
                    .padding(.top, 70)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    
                    LottieView(filename: "Timer", stop: $answerSelected )
                        .frame(width: 70)
                    
                    
                    Text("Category")
                        .font(.caption)
                        .fontWeight(.light)
                    
                    Text("Question")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                }
                
                VStack {
                
                    Spacer()
                    
                    Button(action: {
                        
                        self.firstPressed = true
                        
                        self.secondPressed = false
                        self.thirdPressed = false
                        self.forthPressed = false
                        
                        self.answerSelected = true
                        
                        delayWithSeconds(1) {
                            self.secondCorrect = true
                            
                        }
                        
                        delayWithSeconds(2) {
                            
                            withAnimation(.linear(duration: 1.0)){
                                self.nextIndex += 1
                            }
                        }
                        
                        
                    }, label: {
                        VStack {
                            Text("First answer")
                                .style(.h6)
                                .accessibility(identifier: "firstAnswerButton")
                        }.overlayStyle(isPressed: $firstPressed, isCorrect: $firstCorrect)
                    })
                        .padding(.top, 10)
                    
                    Button(action: {
                        
                        self.secondPressed = true
                        
                        self.firstPressed = false
                        self.thirdPressed = false
                        self.forthPressed = false
                        
                        self.answerSelected = true
                        
                        delayWithSeconds(1) {
                            self.secondCorrect = true
                            
                        }
                        
                        delayWithSeconds(2) {
                            
                            withAnimation(.linear(duration: 1.0)){
                                self.nextIndex += 1
                            }
                        }
                        
                    }, label: {
                        VStack {
                            Text("Second answer")
                                .style(.h6)
                                .accessibility(identifier: "secondAnswerButton")
                        }.overlayStyle(isPressed: $secondPressed, isCorrect: $secondCorrect)
                    })
                        .padding(.top, 10)
                    
                    
                    Button(action: {
                        
                        self.thirdPressed = true
                        
                        self.firstPressed = false
                        self.secondPressed = false
                        self.forthPressed = false
                        
                        self.answerSelected = true
                        
                        delayWithSeconds(1) {
                            self.secondCorrect = true
                            
                        }
                        
                        delayWithSeconds(2) {
                            
                            withAnimation(.linear(duration: 1.0)){
                                self.nextIndex += 1
                            }
                        }
                        
                    }, label: {
                        VStack {
                            Text("Third answer")
                                .style(.h6)
                                .accessibility(identifier: "thirdAnswerButton")
                        }.overlayStyle(isPressed: $thirdPressed, isCorrect: $thirdCorrect)
                    })
                        .padding(.top, 10)
                    
                    
                    Button(action: {
                        
                        self.forthPressed = true
                        
                        self.firstPressed = false
                        self.secondPressed = false
                        self.thirdPressed = false
                        
                        self.answerSelected = true
                        
                        delayWithSeconds(1) {
                            self.secondCorrect = true
                            
                        }
                        
                        delayWithSeconds(2) {
                            
                            withAnimation(.linear(duration: 1.0)){
                                self.nextIndex += 1
                            }
                        }
                    }, label: {
                        VStack {
                            Text("Forth answer")
                                .style(.h6)
                                .accessibility(identifier: "forthAnswerButton")
                        }.overlayStyle(isPressed: $forthPressed, isCorrect: $forthCorrect)
                    })
                        .padding(.top, 10)
                    
                    Spacer()
                }
            }
        }
        
        .onAppear {
                
                delayWithSeconds(10) {
                    
                    self.secondCorrect = true
            }
            
            delayWithSeconds(11) {
                
                withAnimation(.linear(duration: 1.0)) {
                    if self.currentIndex + 1 != self.nextIndex {
                    
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
