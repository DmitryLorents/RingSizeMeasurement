//
//  RingSizeMeasurementViewModel.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 13.08.2024.
//

import UIKit

final class RingSizeMeasurementViewModel: ObservableObject {
    @Published var model: RingMeasurementModel = RingMeasurementModel.createStubModel()
    @Published var onboardingStep: Int = 0
    
    func increaseSize() {
        if model.size < model.maxValue {
            model.size += model.sizeStep
        }
    }
    
    func decreaseSize() {
        if model.size > model.minValue {
            model.size -= model.sizeStep
        }
    }
    
    func formatSize() -> String {
        let divisionReminder = model.size.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 1
        return String(format: "%0.\(divisionReminder)f", model.size)
    }
    
    func sizeInMM() -> CGFloat {
        let nativeScale = Float(UIScreen.main.nativeScale)
        let scale = Float(UIScreen.main.scale)
        let ptToMmCoefficient: Float = 0.15875
        let deviceScaleFactor = scale / nativeScale
        return CGFloat(model.size * deviceScaleFactor / ptToMmCoefficient)
    }
    
    func nextStep() {
        onboardingStep = (onboardingStep + 1) / model.maxOnboardingSteps
    }
}
