//
//  CommentPolygonShape.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentPolygonShape: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        
        let midX = rect.midX
        let maxX = rect.maxX
        let maxY = rect.maxY
        
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: maxX, y: 0))
        path.addLine(to: CGPoint(x: 12.22/20 * maxX, y: 8.56/10 * maxY))
        path.addCurve(
            to: CGPoint(x: 7.78/20 * maxX, y: 8.56/10 * maxY),
            control1: CGPoint(x: 11.03/20 * maxX, y: 9.87/10 * maxY),
            control2: CGPoint(x: 8.97/20 * maxX, y: 9.87/10 * maxY)
        )
        path.closeSubpath()
        return path
    }
}

#Preview {
    VStack(spacing: 0) {
        RoundedRectangle(cornerRadius: 20)
            .fill(.red)
            .frame(height: 100)
            
        CommentPolygonShape()
            .fill(.red)
            .frame(width: 20, height: 10)
            
    }
    
}
