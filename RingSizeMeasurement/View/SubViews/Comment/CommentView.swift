//
//  CommentView2.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView: View {
    let closeButtonAction: () -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                Text("Отрегулируйте размер красного круга так, чтобы он занял все внутреннее пространство кольца")
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
                .fill(.yellow)
        )
        
        
        
    }
}

#Preview {
    CommentView() {print("Close button")}
}
