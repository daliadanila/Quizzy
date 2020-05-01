//
//  LottieView.swift
//  Quizzy
//
//  Created by Dalia on 29/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    var filename = "LottieLogo2"
    @Binding var stop: Bool
    
    var animationView = AnimationView()
    
    class Coordinator: NSObject {
        var parent: LottieView
        
        init(_ animationView: LottieView) {
            self.parent = animationView
            super.init()
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        animationView.animation = Animation.named(filename)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
        if stop == false {
        
            animationView.play { (false) in
                self.animationView.removeFromSuperview()
            }
        }
        else {
            
            animationView.pause()
        }
    }
}
