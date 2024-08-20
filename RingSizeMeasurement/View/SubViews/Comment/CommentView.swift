//
//  CommentView2.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView: View {
    let sideOffset: CGFloat = 20
    let maxHeight: CGFloat
    let closeButtonAction: () -> Void
//    let nextButtonAction: () -> Void
//    let previosButtonAction: () -> Void
//    let nextButtonTitle: String
//    let previousButtonTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    Text("Отрегулируйте размер красного круга так, чтобы он занял все внутреннее пространство кольцаОтрегулируйте размер красного круга так, чтобы он занял все внутреннее пространство кольца Отрегулируйте размер красного круга так, чтобы он занял все внутреннее пространство кольца  ")
                        .multilineTextAlignment(.leading)
//                        .lineLimit(5)
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
                    .fill(.yellow)
            )
            .frame(width: UIScreen.main.bounds.width - 2 * sideOffset)
            
            CommentPolygonShape()
                .fill(.yellow)
                .frame(width: 20, height: 10)
        }
//        .padding(.zero)
        
        
        
    }
}

#Preview {
    CommentView(maxHeight: 200) {print("Close button")}
}
