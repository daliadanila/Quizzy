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

//public struct AnswerButtonStyle: ButtonStyle {
//
//    public func makeBody(configuration: Self.Configuration, isPressed: Bool) -> some View {
//    configuration.label
//            .accentColor(isPressed ? .yellow : .red)
//            .padding()
//            .background(isPressed ? Color.red : .yellow)
//            .cornerRadius(4)
//
//    }
//}


struct RoundedOverlayStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            
            .frame(width: 300, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(.gray))
        
    }
}
