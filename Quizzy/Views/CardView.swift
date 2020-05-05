//
//  CardView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

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
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Rectangle().fill(Color.white).cornerRadius(8)
                .padding()
                .padding(.top, 30)
                .padding(.bottom, 50)
            
            VStack {
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("Question 1/10")
                            .font(.callout)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                    }
                    .padding(.top, 70)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    
                    LottieView(filename: "Timer", stop: $answerSelected )
                        .frame(width: 70)
                        .onAppear {
                            
                            delayWithSeconds(10) {
                                self.secondPressed = true
                                self.secondCorrect = true
                                
                            }
                    }
                    
                    
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
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .background(Color.gray)
    }
}
