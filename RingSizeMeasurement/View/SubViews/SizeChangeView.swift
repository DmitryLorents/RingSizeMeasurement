//
//  SizeChangeView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//
import CoreHaptics
import SwiftUI

struct SizeChangeView: View {
    
    @Binding var size: Float
    @State private var engine: CHHapticEngine?
    var sizeValues: [Float]
    let step: Float
    let increaseAction: () -> Void
    let decreaseAction: () -> Void
    
    private var minSize: Float {
        sizeValues.min() ?? 0
    }
    
    private var maxSize: Float {
        sizeValues.max() ?? 0
    }
    
    var body: some View {
        
        
        HStack {
            Button(action: {
                decreaseAction()
            }, label: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.gray100)
                    .frame(width: 40, height: 40)
                    .overlay(Image(.minus))
            })
            Slider(value: $size, in: minSize...maxSize, step: step)
//                .accentColor(.pinkApp)
            
            Button(action: {
                increaseAction()
            }, label: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.gray100)
                    .frame(width: 40, height: 40)
                    .overlay(Image(.plus))
            })
        }
        
        
    }
    
    private func formatSize() -> String {
        let divisionReminder = size.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 1
        return String(format: "%0.\(divisionReminder)f", size)
    }
}
// Link to Slider implementation with array of values https://stackoverflow.com/questions/68598052/is-there-a-way-to-define-discrete-steps-for-a-slider
