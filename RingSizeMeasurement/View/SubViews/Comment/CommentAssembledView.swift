//
//  CommentView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentAssembledView: View {
    let sideOffset: CGFloat = 20
    let maxHeight: CGFloat
    var body: some View {
        VStack(spacing: 0) {
            CommentView() {print("Close button")}
                .frame(width: UIScreen.main.bounds.width - 2 * sideOffset)
                
            CommentPolygonShape()
                .fill(.yellow)
                .frame(width: 20, height: 10)
        }
//        .frame(maxHeight: .infinity)
        .padding(.zero)
    }
}

#Preview {
    CommentAssembledView(maxHeight: 130)
        
}
