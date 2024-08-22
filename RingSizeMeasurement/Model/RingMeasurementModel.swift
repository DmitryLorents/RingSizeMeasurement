//
//  RingMeasurementModel.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 13.08.2024.
//

import UIKit

struct RingMeasurementModel {
    let tabs: [String]
    let onboardingTexts: [String]
    var size: Float
    let sizeStep: Float
    var onboardingStep: Int
    let maxOnboardingSteps: Int
    let sizeValues: [Float]
    var maxValue: Float {
        sizeValues.max() ?? 0
    }
    var minValue: Float {
        sizeValues.min() ?? 0
    }
    var sizeInMM: Float {
        get {
            let nativeScale = Float(UIScreen.main.nativeScale)
            let scale = Float(UIScreen.main.scale)
            let ptToMmCoefficient: Float = 0.15875
            let deviceScaleFactor = scale / nativeScale
            return size * deviceScaleFactor / ptToMmCoefficient
        }
        set {
            
        }
    }
    
    static func createStubModel() -> Self {
        RingMeasurementModel(
            tabs: ["По кольцу", "По пальцу"],
            onboardingTexts: ["Расположите кольцо так, чтобы внутри был красный круг", "Отрегулируйте размер красного круга так, чтобы он занял все внутреннее пространство кольца", "Приложите палец на красную линию и отрегулируйте красную область по самому широкому месту"],
            size: 18,
            sizeStep: 0.5,
            onboardingStep: 0,
            maxOnboardingSteps: 2,
            sizeValues: Array(stride(from: 12, to: 24, by: 0.5))
        )
    }
}
