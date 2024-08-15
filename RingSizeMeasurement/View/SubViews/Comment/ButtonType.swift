//
//  ButtonType.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

enum ButtonType {
    case light
    case dark
    
    var backgroundColor: Color {
        switch self {
        case .light:
            return .gray100
        case .dark:
            return .black
        }
    }
    
    var textColor: Color {
        switch self {
        case .light:
            return .black
        case .dark:
            return .white
            
        }
    }
}
