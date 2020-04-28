//
//  CardView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Rectangle().fill(Color.white).cornerRadius(8)
                .padding()
                .padding(.top, 30)
                .padding(.bottom, 50)
            
            
            VStack {
                Text("1/10")
            }
            .padding(.top, 70)
            .padding(.leading, 50)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
        .background(Color.gray)
    }
}
