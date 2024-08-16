//
//  CommentView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentAssembledView: View {
    var body: some View {
        VStack(spacing: 0) {
            CommentView() {print("Close button")}
                
            CommentPolygonShape()
                .fill(.yellow)
                .frame(width: 20, height: 10)
        }
        .padding(.zero)
    }
}

#Preview {
    CommentAssembledView()
}
