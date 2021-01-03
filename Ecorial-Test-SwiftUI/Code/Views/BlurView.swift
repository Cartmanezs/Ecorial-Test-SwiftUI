//
//  BlurView.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI

public struct BlurView: UIViewRepresentable {
    var effect: UIBlurEffect.Style
    
    public  func makeUIView(context: Context) ->  UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: effect)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
    public  func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {}
}
