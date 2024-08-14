//
//  CircleView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 14.08.2024.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 72.71, y: 1.29))
            path.addLine(to: CGPoint(x: 1.29, y: 72.71))
            path.move(to: CGPoint(x: 72.71, y: 1.29))
            path.addLine(to: CGPoint(x: 65.64, y: 0))
//            path.move(to: CGPoint(x: 72.71, y: 1.29))
//            path.addLine(to: CGPoint(x: 0, y: 8.36))
            path.move(to: CGPoint(x: 1.29, y: 72.71))
            path.addLine(to: CGPoint(x: 0, y: 65.64))
//            path.move(to: CGPoint(x: 1.29, y: 72.71))
//            path.addLine(to: CGPoint(x: 8.36, y: 0))
            
//            path.move(to: CGPoint(x: 63.23, y: 136.77))
//            path.addCurve(to: CGPoint(x: 136.77, y: 136.77), control1: CGPoint(x: 83.54, y: 157.08), control2: CGPoint(x: 116.46, y: 157.08))
//            path.addCurve(to: CGPoint(x: 136.77, y: 63.23), control1: CGPoint(x: 157.08, y: 116.46), control2: CGPoint(x: 157.08, y: 83.54))
//            path.addCurve(to: CGPoint(x: 63.23, y: 63.23), control1: CGPoint(x: 116.46, y: 42.92), control2: CGPoint(x: 83.54, y: 42.92))
//            path.addCurve(to: CGPoint(x: 63.23, y: 136.77), control1: CGPoint(x: 42.92, y: 83.54), control2: CGPoint(x: 42.92, y: 116.46))
//            path.closeSubpath()
            
//            path.addLine(to: CGPoint(x: 64.29, y: 135.71))
//            path.move(to: CGPoint(x: 135.71, y: 64.29))
//            path.addLine(to: CGPoint(x: 128.64, y: 0))
//            path.move(to: CGPoint(x: 135.71, y: 64.29))
//            path.addLine(to: CGPoint(x: 0, y: 71.36))
//            path.move(to: CGPoint(x: 64.29, y: 135.71))
//            path.addLine(to: CGPoint(x: 0, y: 128.64))
//            path.move(to: CGPoint(x: 64.29, y: 135.71))
//            path.addLine(to: CGPoint(x: 71.36, y: 0))
            
        }
        .fill(.clear)
        .stroke(.redApp, lineWidth: 2)
    }
}

#Preview {
    CircleView()
}
