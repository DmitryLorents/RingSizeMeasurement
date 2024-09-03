//
//  View + Extension.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 16.08.2024.
//

import SwiftUI

extension View {
    
    func onboarding(
        maxOnboardingSteps: Int,
        onboardingStep: Binding<Int>,
        enabled: Bool,
        text: String,
        yOffset: CGFloat,
        maxCommentHeight: CGFloat,
        maskContent: () -> some View,
       @ViewBuilder buttons: @escaping () -> some View
    ) -> some View {
        overlay(
            Color.black.opacity(0.4)
                .reverseMask {
                    maskContent()
                }
                .frame(width: 10000, height: 10000)
                .opacity(enabled ? 1 : 0)
        )
        .zIndex(enabled ? 1 : 0)
        .overlay(
            CommentView(
                onboardingStep: onboardingStep,
                text: text,
                maxOnboardingSteps: maxOnboardingSteps,
                buttons: buttons
            )
            .offset(y: -yOffset)
            .frame(minHeight: maxCommentHeight)
            .opacity(enabled ? 1 : 0)
            .zIndex(enabled ? 1 : 0)
        )
    }

    @inlinable func reverseMask(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> some View
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
