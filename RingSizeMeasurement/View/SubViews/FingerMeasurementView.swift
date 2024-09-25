//
//  DiameterMeasurementView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 14.08.2024.
//

import SwiftUI

struct FingerMeasurementView: View {
    @Binding var size: Float
    @Binding var isImageVisible: Bool
    var body: some View {
        
        LineMeasurementShape()
            .frame(width: UIScreen.main.bounds.width, height: CGFloat(size))
            .overlay(
                HStack {
                    Image(.hand)
                        .opacity(isImageVisible ? 1 : 0)
                    Spacer()
                }
                
            )
    }
    
}

#Preview {
    RingSizeMeasurementView()
}
