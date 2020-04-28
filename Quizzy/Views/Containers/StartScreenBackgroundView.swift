//
//  StartScreenBackgroundView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct StartScreenBackgroundView: View {
    
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
        }
    }
}

struct StartScreenBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenBackgroundView()
    }
}
