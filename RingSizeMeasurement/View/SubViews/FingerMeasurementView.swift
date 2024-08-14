//
//  DiameterMeasurementView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 14.08.2024.
//

import SwiftUI

struct FingerMeasurementView: View {
    @Binding var size: Float
    var body: some View {
        
        Image(.fingerMeasurement)
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: CGFloat(size))
            .overlay(Image(.hand))
    }
}

//#Preview {
//    FingerMeasurementView(size: 100)
//}
