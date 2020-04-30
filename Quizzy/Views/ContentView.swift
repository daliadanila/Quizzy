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
        
        NavigationView {
            
            TabView {
                
                ZStack {
                    
                    StartScreenBackgroundView()
                    
                    VStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: CardContainerView().hideNavigationBar(), isActive: $startedPlaying) {
                            
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
                    
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
                Text("The content of the second view")
                    .tabItem {
                        Image(systemName: "folder")
                        Text("Settings")
                }
            }
            
            
        }
        
    }
}

public struct NavigationBarHider: ViewModifier {
    @State var isHidden: Bool = false
    
    public func body(content: Content) -> some View {
        content
            .navigationBarTitle("")
            .navigationBarHidden(isHidden)
            .onAppear { self.isHidden = true }
    }
}

extension View {
    public func hideNavigationBar() -> some View {
        modifier(NavigationBarHider())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
