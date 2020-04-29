//
//  SecondaryView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct SecondaryView: View {
    
    var title: String
    
    init(title: String) {
        
        self.title = title
        
    }
    
    var body: some View {
        
        Text(self.title)
            .font(.footnote)
            .frame(width: 300, height: 50)
            .foregroundColor(.black)
            .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(.black)
        )
        
    }
}

struct SecondaryView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryView(title: "How to play?")
    }
}
