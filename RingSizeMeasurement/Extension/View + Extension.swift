//
//  View + Extension.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 16.08.2024.
//

import SwiftUI

extension View {
    
    func onboarding(
        enabled: Bool,
        frameRect: CGRect = CGRect(x: 0, y: 0, width: 150, height: 100)
    ) -> some View {
        
        
        self
            .overlay(
                Color.black.opacity(0.5)
                    .reverseMask {
                        RoundedRectangle(cornerRadius: frameRect.height / 2)
                            .fill(.blue)
                            .frame(width: frameRect.width, height: frameRect.height)
                    }
                    .frame(width: 10_000, height: 10_000)
                    .opacity(enabled ? 1 : 0)
            )
            .zIndex(enabled ? 1 : 0)
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
