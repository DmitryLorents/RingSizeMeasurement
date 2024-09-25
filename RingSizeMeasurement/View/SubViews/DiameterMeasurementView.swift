//
//  DiameterMeasurementView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 14.08.2024.
//

import SwiftUI

struct DiameterMeasurementView: View {
    @Binding var size: Float
    @Binding var isImageVisible: Bool
    
    var body: some View {
            
            RoundMeasurementShape()
                .frame(width: CGFloat(size), height: CGFloat(size), alignment: .center)
                .overlay(
                    Image(.ring)
                        .opacity(isImageVisible ? 1 : 0)
                    )
    }
}
