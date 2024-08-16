//
//  CoordinateSpaceFrameProvider.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 16.08.2024.
//

import SwiftUI

struct CoordinateSpaceFrameProvider: ViewModifier {
    var shouldIgnore: Bool
    ///  global -> framse as per global view
    ///  local -> bounds
    ///  named -> you own named space.
    var coordinateSpace: CoordinateSpace
    let frame: (_ frame: CGRect) -> Void
    
    @ViewBuilder func body(content: Content) -> some View {
        if shouldIgnore {
            content
        } else {
            content
                .background(GeometryReader(content: { contentProxy in
                    Color.clear.onAppear {
                        frame(contentProxy.frame(in: coordinateSpace))
                    }
                }))
        }
        
    }
}
