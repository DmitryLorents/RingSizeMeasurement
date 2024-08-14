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
            tabs: ["По кольцу", "По пальцу"], size: 18)
    }
}
