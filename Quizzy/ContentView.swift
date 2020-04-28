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
            
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                Button(action: {
                    
                    Text("start playing")
                    
                }) {
                    RoundedButtonView(title: "START PLAYING")
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
