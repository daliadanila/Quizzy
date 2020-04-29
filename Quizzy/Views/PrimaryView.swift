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
    
    init(title: String) {
        
        self.title = title
    }
    
    var body: some View {
        
        HStack {
        
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
        PrimaryView(title: "Share")
    }
}
