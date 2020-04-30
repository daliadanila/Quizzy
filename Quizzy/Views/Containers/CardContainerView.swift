//
//  CardContainerView.swift
//  Quizzy
//
//  Created by Dalia on 28/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct CardContainerView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(FlatMagenta()), Color(FlatPlumDark())]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    
                    Button(action: {
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        
                        RectangleImageView(icon: "xmark")
                            .padding(.leading, 15)
                            .padding(.top, 15)
                            .accessibility(identifier: "closeButton")
                    }
                    Spacer()
                    
                    Text("0 Points")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    Text("3 Lives")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 15)
                    
                    
                }
                .padding(.bottom, -25)
                
                CardView()
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
        
    }
}


struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView()
    }
}
