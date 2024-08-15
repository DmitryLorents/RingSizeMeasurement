//
//  CommentView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
                .frame(height: 100)
                
            CommentPolygonShape()
                .fill(.red)
                .frame(width: 20, height: 10)
        }
        .padding(.zero)
    }
}
