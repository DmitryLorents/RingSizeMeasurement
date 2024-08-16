//
//  DiameterMeasurementView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 14.08.2024.
//

import SwiftUI

struct DiameterMeasurementView: View {
    @Binding var size: Float
    
    var body: some View {
            
            Image(.circleWithArrows)
                .resizable()
                .frame(width: CGFloat(size), height: CGFloat(size), alignment: .center)
    }
}
