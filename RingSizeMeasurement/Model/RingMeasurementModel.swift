//
//  RingMeasurementModel.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 13.08.2024.
//

import UIKit

struct RingMeasurementModel {
    let tabs: [String]
    var size: Float
    let step: Float
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
            size: 18,
            step: 0.5,
            sizeValues: Array(stride(from: 12, to: 24, by: 0.5))
        )
    }
}
