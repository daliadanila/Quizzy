//
//  ContentView.swift
//  Quizzy
//
//  Created by Dalia on 27/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(FlatYellow()), Color(FlatGreenDark())]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(Color(FlatYellow()))
                .frame(width: 600, height: 1000)
                .opacity(0.3)
            
            Image("QuizzyText")
                .resizable()
                .frame(width: 300, height: 100)
            
            
            VStack() {
                
                Spacer()
                
                Button(action: {
                    
                    
                    
                }) {
                    SecondaryButtonView(title: "How to play ?")
                        
                        .accessibility(identifier: "howToPlayButton")
                        
                        .padding(.bottom, 20)
                }
                
                Button(action: {
                    
                    
                    
                }) {
                    PrimaryButtonView(title: "START PLAYING")
                        
                        .accessibility(identifier: "startPlayingButton")
                        
                        .padding(.bottom, 100)
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
