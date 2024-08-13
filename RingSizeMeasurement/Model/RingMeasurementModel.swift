//
//  RingMeasurementModel.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 13.08.2024.
//

import Foundation

struct RingMeasurementModel {
    let tabs: [String]
    var size: Float
    
    static func createStubModel() -> Self {
        RingMeasurementModel(
            tabs: ["По кольцу", "По пальцу"], size: 18)
    }
}
