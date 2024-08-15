//
//  CommentView2.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView2: View {
    let closeButtonAction: () -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Отрегулируйте размер красного круга так, чтобы он занял все внутреннее пространство кольца")
                Button(action: {
                    print("Close button")
                }, label: {
                    Image(.closeButton)
                })
                
            }
        }
        
        HStack {
            Image(.onboardingProgress)
            Spacer()
            
        }
        
        
    }
}

#Preview {
    CommentView2() {print("Close button")}
        .border(.black)
}
