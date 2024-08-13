//
//  Tab.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 13.08.2024.
//

import Foundation

struct Tab {
    let title: String
    let id: String
    let screenElements: [ScreenElement]
}

struct ScreenElement {
    let id: String
    let image: String?
    let title: String
    let text: [String]
    let buttons: [ButtonModel]
}

struct ButtonModel {
    let id: String
    let action: String
    let label: String
}
