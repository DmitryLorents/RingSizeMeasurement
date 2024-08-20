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
        
//        ZStack(alignment: .leading) {
//            Image(.fingerMeasurement)
//                .resizable()
//                .frame(maxWidth: .infinity)
//                .frame(height: CGFloat(size))
//            
//            Image(.hand)
//        }
        
        Image(.fingerMeasurement)
            .resizable()

            .frame(width: UIScreen.main.bounds.width, height: CGFloat(size))
            
            .overlay(
                HStack {
                    Image(.hand)
                    Spacer()
                }
               
            )
    }
        
}

#Preview {
    RingSizeMeasurementView()
}
