//
//  CommentView2.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView: View {
    var horizontalOffset: CGFloat = 20
    let text: String
//    let maxHeight: CGFloat
    let closeButtonAction: () -> Void
//    let nextButtonAction: () -> Void
//    let previosButtonAction: () -> Void
//    let nextButtonTitle: String
//    let previousButtonTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 10)
                    
                    Spacer()
                    Button(action: {
                        print("Close button")
                    }, label: {
                        Image(.closeButton)
                    })
                    
                }
                
                HStack {
                    Image(.onboardingProgress)
                    Spacer()
                    OnboardingButtonView(
                        action: {
                            print("Button1")
                        },
                        label: "Назад",
                        buttonType: .light
                    )
                    
                    OnboardingButtonView(
                        action: {
                            print("Button2")
                        },
                        label: "Понятно",
                        buttonType: .dark
                    )
                    
                }
                
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
            )
            .frame(width: UIScreen.main.bounds.width - 2 * horizontalOffset)
            
            CommentPolygonShape()
                .fill(.white)
                .frame(width: 20, height: 10)
        }
        
        
        
    }
}

#Preview {
    CommentView(text: "vbndjkvvnenvelnvnvlknklvnkvernvienvierdomweo") {print("Close button")}
}
