//
//  LineMeasurementShape.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 24.09.2024.
//

import SwiftUI

struct LineMeasurementShape: View {
    var body: some View {
        GeometryReader(content: { geometry in
            let xMax = geometry.frame(in: .local).maxX
            let yMax = geometry.frame(in: .local).maxY
            
            Path { path in
                path.addRect(geometry.frame(in: .local))
            }
            .fill(.pinkApp)
            
            Path { path in
                path.addRect(CGRect(x: 0, y: 0, width: geometry.size.width, height: 2))
                path.addRect(CGRect(x: 0, y: yMax - 2, width: geometry.size.width, height: 2))
            }
            .fill(.redApp)
            
            Path { path in
                let x: Double = 15
                let y: Double = 2.5
                let offset: Double = 5
                path.move(to: CGPoint(x: x, y: y))
                path.addLine(to: CGPoint(x: x, y: yMax - y))
                path.addLine(to: CGPoint(x: x + offset, y: yMax - y - offset))
                path.move(to: CGPoint(x: x, y: yMax - y))
                path.addLine(to: CGPoint(x: x - offset, y: yMax - y - offset))
                path.move(to: CGPoint(x: x, y: y))
                path.addLine(to: CGPoint(x: x - offset, y: y + offset))
                path.move(to: CGPoint(x: x, y: y))
                path.addLine(to: CGPoint(x: x + offset, y: y + offset))
                
                path.move(to: CGPoint(x: xMax - x, y: y))
                path.addLine(to: CGPoint(x: xMax - x, y: yMax - y))
                path.addLine(to: CGPoint(x: xMax - x - offset, y: yMax - y - offset))
                path.move(to: CGPoint(x: xMax - x, y: yMax - y))
                path.addLine(to: CGPoint(x: xMax - x + offset, y: yMax - y - offset))
                path.move(to: CGPoint(x: xMax - x, y: y))
                path.addLine(to: CGPoint(x: xMax - x - offset, y: y + offset))
                path.move(to: CGPoint(x: xMax - x, y: y))
                path.addLine(to: CGPoint(x: xMax - x + offset, y: y + offset))
            }
            .stroke(.redApp, lineWidth: 1)
        })
    }
}

#Preview {
    LineMeasurementShape()
        .frame(width: UIScreen.main.bounds.width, height: 100)
        
}
