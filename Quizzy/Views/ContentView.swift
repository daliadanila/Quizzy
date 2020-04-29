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
    
    @State var startedPlaying: Bool = false
    
    var body: some View {
        
        ZStack {
            
            if startedPlaying {
                
                CardContainerView()
            }
            else {
                
                StartScreenBackgroundView()
                
                VStack() {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.startedPlaying = true
                        
                    }) {
                        PrimaryView(title: "START PLAYING")
                            .padding(.bottom, 300)
                            .accessibility(identifier: "startPlayingButton")
                    }
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
