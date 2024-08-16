//
//  View + Extension.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 16.08.2024.
//

import SwiftUI

extension View {
    
    func onboarding(enabled: Bool, maskContent: () -> some View) -> some View {
        
        self
            .overlay(
                Color.black.opacity(0.4)
                    .reverseMask {
                        maskContent()
                    }
                    .frame(width: 10_000, height: 10_000)
                    .opacity(enabled ? 1 : 0)
            )
            .zIndex(enabled ? 1 : 0)
            .overlay(
                CommentAssembledView()
                    .frame(height: 200)
                    .offset(x: 0, y: -140)
                    .opacity(enabled ? 1 : 0)
                    .zIndex(enabled ? 50 : 0)
            )
        
    }
        
    
    @inlinable func reverseMask<Mask: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> Mask
    ) -> some View {
            self.mask(
                ZStack {
                    Rectangle()
                    mask()
                        .blendMode(.destinationOut)
                }
            )
        }
}

#Preview {
    RingSizeMeasurementView()
}
