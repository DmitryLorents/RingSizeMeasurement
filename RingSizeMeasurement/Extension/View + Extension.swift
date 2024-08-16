//
//  View + Extension.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 16.08.2024.
//

import SwiftUI

extension View {
    
    func onboarding(enabled: Bool, yOffset: CGFloat = 0, maskContent: () -> some View) -> some View {

        return self
//            .modifier(CoordinateSpaceFrameProvider(coordinateSpace: .local, frame: { frame in
//                frameMeasured = frame
//                print("Frame measured", frame)
//            }))
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
                    .frame(minHeight: 300)
                    .offset(x: 0, y: yOffset-60)
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
