//
//  View + Extension.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 16.08.2024.
//

import SwiftUI

extension View {
    
    func onboarding(enabled: Bool, yOffset: CGFloat = 0, maxCommentHeight: CGFloat, maskContent: () -> some View) -> some View {

        return self
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
                CommentAssembledView(maxHeight: 100)
//                    .border(Color.black)
//                    .frame(height: 10_000)
                    .frame(minHeight: maxCommentHeight)
                    .frame(maxHeight: 100)
//                    .frame(minHeight: .greatestFiniteMagnitude)
                    .offset(x: 0, y: yOffset-80)
                    .opacity(enabled ? 1 : 0)
                    .zIndex(enabled ? 1 : 0)
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
