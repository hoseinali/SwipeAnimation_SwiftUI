//
//  LiquidSwipe.swift
//  SwipeAnimationSwiftUI
//
//  Created by Hossein Ali Alborzi on 4/13/21.
//

import SwiftUI

struct LiquidSwipe: Shape {
    var offest:CGSize
    
    var animatableData: CGSize.AnimatableData {
        get{ return offest.animatableData}
        set{ offest.animatableData = newValue }
        
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let width = rect.width + (-offest.width > 0 ? offest.width : 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            path.addLine(to: CGPoint(x: width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            
            let from = 80 + (offest.width)
            path.move(to: CGPoint(x: width, y: from > 80 ? 80 :from ))
            
            var to = 180 + (offest.height) + (-offest.width)
            to = to < 180 ? 180: to
            let mid : CGFloat = 80 + ((to - 80) / 2)
            
            path.addCurve(to: CGPoint(x: width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))

        }
    }
    
    
    
}

