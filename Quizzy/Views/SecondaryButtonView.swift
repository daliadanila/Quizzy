//
//  SecondaryButtonView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct SecondaryButtonView: View {
    
    var title: String
    
    init(title: String) {
        
        self.title = title
        
    }
    
    var body: some View {
        
        Text(self.title)
            .font(.footnote)
            .frame(width: 100, height: 30)
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(Color.white)
        )
        
    }
}

struct SecondaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButtonView(title: "How to play?")
    }
}
