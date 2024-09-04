//
//  SizeChangeView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//
import SwiftUI

struct SliderStepperView: View {
    
    @Binding var value: Float
    private let values: [Float]
    var accentColor: Color
    
    private var minValue: Float {
        values.min() ?? 0.0
    }
    private var maxValue: Float {
        values.max() ?? 0.0
    }
    
    private var increaseAction: () -> Void  {
        { let index = values.firstIndex(where: { $0 == value}) ?? 0
            if index < values.count - 1 {
                value = values[index + 1]
            } }
    }
    
    private var decreaseAction: () -> Void {
        { let index = values.firstIndex(where: { $0 == value}) ?? 0
            if index > 0 {
                value = values[index - 1]
            }}
    }
    
    init(value: Binding<Float>,
         in values: [Float],
         accentColor: Color = .pink
    ) {
        _value = value
        self.values = values
        self.accentColor = accentColor
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
            DiscreteSlider(value: $value, in: values, accentColor: accentColor)
                
            
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

}
