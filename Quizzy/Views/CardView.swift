//
//  CardView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
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
                    
                    LottieView(filename: "Timer")
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
                        
                        
                    }) {
                        
                        SecondaryView(title: "First answer")
                            .accessibility(identifier: "firstAnswerButton")
                    }
                    .padding(.top, 10)
                    
                    Button(action: {
                        
                        
                    }) {
                        SecondaryView(title: "Second answer")
                            .accessibility(identifier: "secondAnswerButton")
                    }
                    .padding(.top, 10)
                    
                    
                    Button(action: {
                        
                        
                    }) {
                        
                        SecondaryView(title: "Third answer")
                            .accessibility(identifier: "thirdAnswerButton")
                    }
                    .padding(.top, 10)
                    
                    
                    Button(action: {
                        
                        
                    }) {
                        
                        SecondaryView(title: "Forth answer")
                            .accessibility(identifier: "forthAnswerButton")
                    }
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
