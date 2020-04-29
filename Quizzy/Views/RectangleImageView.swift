//
//  RectangleImageView.swift
//  Quizzy
//
//  Created by Dalia on 29/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct RectangleImageView: View {
      
    var icon: String
    
    init(icon: String) {
        
        self.icon = icon
    }
    
    var body: some View {
        
        ZStack {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .bold))
            
        }
        .padding()
        .foregroundColor(Color.white)
        .background(Color.white)
        .cornerRadius(10)
        .opacity(0.5)
    }
}

struct RectangleImageView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleImageView(icon: "xmark")
            .background(Color.purple)
    }
}
