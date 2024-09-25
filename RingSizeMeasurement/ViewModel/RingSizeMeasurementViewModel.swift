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
    @Published var magnificationCounter = 0
    var isImageVisible: Bool {
        get {
            onboardingStep > 0
        }
        set{}
    }
    
    
    
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
        CGFloat(model.size * ppi / 25.4 )
    }
    
    private var ppi: Float {
        let nativeWidth = UIScreen.main.nativeBounds.width
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        if nativeWidth < 1100 {
            switch (width, height) {
            case (320.0, 480.0):
                            return 163.0
                        case (320.0, 568.0):
                            return 163.0
                        case (375.0, 667.0):
                            return 163.0
                        case (375.0, 812.0):
                            return 158.67
                        case (414.0, 736.0):
                            return 133.67
                        default:
                            return 163.0
            }
        } else {
            switch (width, height) {
            case (375.0, 812.0):
                            return 152.67
                        case (390.0, 844.0):
                            return 153.33
                        case (393.0, 852.0):
                            return 153.33
                        case (414.0, 896.0):
                            return 152.67
                        case (428.0, 926.0):
                            return 152.67
                        case (430.0, 932.0):
                            return 153.33
                        default:
                            return 152.67
            }
        }
    }
    
    func nextStep() {
        onboardingStep = (onboardingStep + 1) / model.maxOnboardingSteps
    }
}
