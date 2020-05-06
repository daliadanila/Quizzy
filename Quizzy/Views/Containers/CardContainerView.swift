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
    
    @State var questionCount = 0
    
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
                
                
                
                ZStack(alignment:.leading){
                    ZStack(alignment:.top){
                        ForEach(0...3, id:\.self){i in
                            ZStack(){
                                if self.questionCount == i{
                                    CardView()
                                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                                    .onAppear {
                                        
                                        delayWithSeconds(11) {
                                            
                                            withAnimation(.linear(duration: 1.0)){
                                                self.questionCount += 1
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                    
                }
                
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
