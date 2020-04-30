//
//  Text+Style.swift
//  Quizzy
//
//  Created by Dalia on 30/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

extension Text {
    
    func customStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
    
    enum Style {
        case h6, h7
    }
    
    func style(_ style: Style) -> Text {
        switch style {
            
        case .h6:
            return
                font(.callout)
                    .foregroundColor(.black)
            
        case .h7:
            return
                font(.footnote)
                    .fontWeight(.bold)
        }
    }
}
