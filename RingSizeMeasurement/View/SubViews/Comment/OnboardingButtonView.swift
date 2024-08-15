//
//  OnboardingButtonView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct OnboardingButtonView: View {
    var action: () -> Void
    var label: String
    let buttonType: ButtonType
    
    var body: some View {
        Button(action: {action()}, label: {
            Text(label)
                .foregroundStyle(buttonType.textColor)
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
        })
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(buttonType.backgroundColor)
        )
    }
}

#Preview {
    OnboardingButtonView(
        action: {
        print("button action")
    },
    label: "Назад",
    buttonType: .light)
}
