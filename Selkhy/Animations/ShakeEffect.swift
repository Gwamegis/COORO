//
//  ShakeEffect.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

struct ShakeEffect: AnimatableModifier {
    
    var delta: CGFloat = 0
    
    var animatableData: CGFloat {
        get {
            delta
        } set {
            delta = newValue
        }
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: sin(delta * .pi * 4.0) * CGFloat.random(in: 2...5)))
            .offset(x: sin(delta * 2 * .pi * 1.2),
                    y: cos(delta * 2 * .pi * 1.1))
    }
}

