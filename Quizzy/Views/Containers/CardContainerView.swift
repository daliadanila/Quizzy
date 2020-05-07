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
    
    @State var questionCount = 1
    
    var body: some View {
        
        func makeQuestionsStack() -> some View  {
            
            ZStack(alignment:.leading)
            {
                ZStack(alignment:.top)
                {
                    ForEach(1...10, id:\.self)
                    { i in
                        ZStack()
                            {
                                if self.questionCount == i
                                {
                                    CardView(currentIndex: i, totalNumber: 10, nextIndex: self.$questionCount)
                                        .transition(.slide)
                                }
                        }
                        
                    }
                }
                
            }
        }
        
        func makeTopHStack() -> some View {
            
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
                
                Text("0 Points").style(.h4)
                
                Spacer()
                
                Text("3 Lives").style(.h4).padding(.trailing, 15)
            }
        }
        
        func makeCardContainerView() -> some View {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(FlatMagenta()), Color(FlatPlumDark())]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    makeTopHStack().padding(.bottom, -25)
                    
                    makeQuestionsStack()
                    
                }.edgesIgnoringSafeArea(.bottom)
                
            }
        }
        
        return makeCardContainerView()
        
    }
}


struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView()
    }
}
