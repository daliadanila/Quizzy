//
//  RoundedButtonView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct RoundedButtonView: View {
    
    var title: String
    
    var icon: String
    
    init(title: String, icon: String? = nil) {
        
        self.title = title
        
        self.icon = icon ?? ""
    }
    
    var body: some View {
        
        HStack {
            
            if (self.icon.count != 0) {
                
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
            }
            
            Text(self.title)
                .font(.callout)
                .fontWeight(.bold)
            
            
        }
        .padding()
        .foregroundColor(Color(FlatGreenDark()))
        .background(Color.white)
        .cornerRadius(.infinity)
        
        
    }
}
struct RoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
         RoundedButtonView(title: "Share", icon: "square.and.arrow.up")
        
            .background(Color.red)
    }
}
