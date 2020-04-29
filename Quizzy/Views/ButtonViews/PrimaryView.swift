//
//  PrimaryView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct PrimaryView: View {
    
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
                .font(.footnote)
                .fontWeight(.bold)
                .frame(width: 200)
            
            
        }
        .padding()
        .foregroundColor(Color(FlatGreenDark()))
        .background(Color.white)
        .cornerRadius(.infinity)
    }
}
struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView(title: "Share", icon: "square.and.arrow.up")
    }
}
