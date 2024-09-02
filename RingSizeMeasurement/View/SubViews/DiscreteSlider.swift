//
//  DescreteSlider.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 01.09.2024.
//

import SwiftUI

struct DiscreteSlider<T: Comparable>: View {
    @Binding var value: T
    private let accentColor: Color
    //    private var size: Binding<Float> {
    //    Binding(
    //        get: { Float(index) },
    //        set: { index = Int($0); value = values[Int($0)] }
    //      )  }
    private let values: [T]
    private let upperBound: Float
    @State private var index: Int
    
    init(value: Binding<T>, in values: [T], accentColor: Color = .pink) {
        self._value = value
        self._index = State(initialValue: values.firstIndex(of: value.wrappedValue) ?? 0)
        
        self.values = values
        self.upperBound = Float(values.count - 1)
        self.accentColor = accentColor
    }
    
    var body: some View {
        Slider(
            value:Binding(
            get: { Float(index) },
            set: { index = Int($0); value = values[Int($0)] }
        ),
               in: 0...upperBound, step: 1)
        .accentColor(accentColor)
        .valueChanged(value: value) { newValue in
            index = values.firstIndex(of: newValue) ?? 0
        }
    }
}
