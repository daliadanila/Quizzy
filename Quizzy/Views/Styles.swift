//
//  Styles.swift
//  Quizzy
//
//  Created by Dalia on 30/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

public struct PrimaryButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 200)
            .padding()
            .foregroundColor(Color(FlatGreenDark()))
            .background(Color.white)
            .cornerRadius(.infinity)
        
        
    }
}

struct SelectedAnswerOverlayStyle: ViewModifier {
    
    @Binding var isPressed: Bool
    
    func body(content: Content) -> some View {
        content
            
            .frame(width: 300, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(self.isPressed ? Color(FlatYellowDark()) : Color(FlatGray()))
                
        )
        .background(self.isPressed ? Color(FlatYellowDark()) : Color.white)
        .cornerRadius(.infinity)
    }
}
