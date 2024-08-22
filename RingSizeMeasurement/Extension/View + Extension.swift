//
//  View + Extension.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 16.08.2024.
//

import SwiftUI
import Combine

extension View {
    
    func onboarding(
        maxOnboardingSteps: Int,
        onboardingStep: Binding<Int>,
        enabled: Bool,
        text: String,
        yOffset: CGFloat,
        maxCommentHeight: CGFloat,
        maskContent: () -> some View
    ) -> some View {
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
                CommentView(onboardingStep: onboardingStep,
                            text: text,
                            maxOnboardingSteps: maxOnboardingSteps
                           )
                .offset(y: -yOffset )
                    .frame(minHeight: maxCommentHeight)
//
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
    
    /// Choosing correct .onChange implementation depending on iOS version
    @ViewBuilder func valueChanged<T: Equatable>(value: T, onChange: @escaping (T) -> Void) -> some View {
        if #available(iOS 17.0, *) {
            self.onChange(of: value) { oldValue, newValue in
                onChange(value)
            }
        } else {
            self.onChange(of: value, perform: { value in
                onChange(value)
            })
        }
    }
}

#Preview {
    RingSizeMeasurementView()
}
