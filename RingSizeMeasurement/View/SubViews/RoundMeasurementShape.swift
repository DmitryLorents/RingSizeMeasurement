//
//  RoundMeasurementShape.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 24.09.2024.
//

import SwiftUI

struct RoundMeasurementShape: View {
    var body: some View {
        GeometryReader(content: { geometry in
            let borderWidth: CGFloat = 2
            let borderWidthOffset = borderWidth + 0.5
            let offset: CGFloat = 5
            Path { path in
                path.addRoundedRect(in: geometry.frame(in: .local), cornerSize: CGSize(width: geometry.size.width / 2, height: geometry.size.height / 2))
            }
            .fill(.pinkApp)
            
            Path { path in
                let width = geometry.size.width -  borderWidth
                let heigh = geometry.size.height -  borderWidth
                path.addRoundedRect(in: CGRect(x: borderWidth / 2, y: borderWidth / 2, width: width, height: heigh), cornerSize: CGSize(width: geometry.size.width / 2, height: geometry.size.height / 2))
            }
            .stroke(.redApp, lineWidth: borderWidth)
            
            Path { path in
                let midX = geometry.frame(in: .local).midX
                let maxY = geometry.frame(in: .local).maxY
                path.move(to: CGPoint(x: midX, y: borderWidthOffset))
                path.addLine(to: CGPoint(x: midX, y: maxY - borderWidthOffset))
                path.addLine(to: CGPoint(x: midX - offset, y: maxY - borderWidthOffset - offset))
                path.move(to: CGPoint(x: midX, y: maxY - borderWidthOffset))
                path.addLine(to: CGPoint(x: midX + offset, y: maxY - borderWidthOffset - offset))
                path.move(to: CGPoint(x: midX, y: borderWidthOffset))
                path.addLine(to: CGPoint(x: midX + offset, y: borderWidthOffset + offset))
                path.move(to: CGPoint(x: midX, y: borderWidthOffset))
                path.addLine(to: CGPoint(x: midX - offset, y: borderWidthOffset + offset))
                
            }
            .stroke(.redApp, lineWidth: 1)
            .rotationEffect(.degrees(45))
            
            
        })
    }
}

#Preview {
    RoundMeasurementShape()
        .frame(width: 100, height: 100)
        .border(Color.black)
}
