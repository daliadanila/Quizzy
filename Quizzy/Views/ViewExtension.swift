//
//  ViewExtension.swift
//  Quizzy
//
//  Created by Dalia on 30/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

extension View {
    public func hideNavigationBar() -> some View {
        modifier(NavigationBarHider())
    }
    
    func overlayStyle(isPressed: Binding<Bool>, isCorrect: Binding<Bool>) -> some View {
        self.modifier(SelectedAnswerOverlayStyle(isPressed: isPressed, isCorrect: isCorrect))
    }
}
