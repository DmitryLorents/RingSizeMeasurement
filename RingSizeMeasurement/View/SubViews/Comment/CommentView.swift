//
//  CommentView2.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView: View {
    var horizontalOffset: CGFloat
    let text: String
    var maxOnboardingSteps: Int
    @Binding private var onboardingStep: Int
    var closeButtonAction: (() -> Void)?
    
    init(horizontalOffset: CGFloat = 20,
         text: String,
         maxOnboardingSteps: Int,
         onboardingStep: Binding<Int>,
         closeButtonAction: @escaping () -> Void) {
        self.horizontalOffset = horizontalOffset
        self.text = text
        self.maxOnboardingSteps = maxOnboardingSteps
        _onboardingStep = onboardingStep
        self.closeButtonAction = closeButtonAction
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 10)
                    
                    Spacer()
                    Button(action: {
                        closeButtonActionUnwrapped()
                    }, label: {
                        Image(.closeButton)
                    })
                    
                }
                
                HStack {
                    Image(onboardingSliderImage)
                        .opacity(maxOnboardingSteps == 1 ? 0 : 1)
                    Spacer()
                    HStack {
                        buttons
                    }
                    //                    OnboardingButtonView(
                    //                        action: {
                    //                            print("Button1")
                    //                        },
                    //                        label: "Назад",
                    //                        buttonType: .light
                    //                    )
                    //
                    //                    OnboardingButtonView(
                    //                        action: {
                    //                            print("Button2")
                    //                        },
                    //                        label: "Понятно",
                    //                        buttonType: .dark
                    //                    )
                    //
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
    
    var onboardingSliderImage: ImageResource {
        onboardingStep == 1 ? .onboardingSlider1 : .onboardingSlider2
    }
    
    var darkButtonText: String {
        maxOnboardingSteps == onboardingStep ? "Понятно" : "Далее"
    }
    
    
    
    var darkButtonAction: () -> Void {
        maxOnboardingSteps == onboardingStep
        ? closeButtonActionUnwrapped
        : {onboardingStep = (onboardingStep + 1) / maxOnboardingSteps}
    }
 
    @ViewBuilder var buttons: some View {
        switch onboardingStep {
        case 1:
            OnboardingButtonView(
                action: {
                    darkButtonAction()
                },
                label: darkButtonText,
                buttonType: .dark
            )
        case 2:
            OnboardingButtonView(
                action: {
                    
                },
                label: "Назад",
                buttonType: .light
            )
            
            OnboardingButtonView(
                action: {
                    darkButtonAction()
                },
                label: "Понятно",
                buttonType: .dark
            )
        default:
            EmptyView()
        }
        
        
        
    }
    
    var closeButtonActionUnwrapped: () -> Void {
        if let closeButtonAction {
            closeButtonAction
        } else {
            {onboardingStep = 0}
        }
        
    }
    
    func previousButtonAction() {
        onboardingStep -= 1
    }
}

//#Preview {
//    CommentView(text: "vbndjkvvnenvelnvnvlknklvnkvernvienvierdomweo") {print("Close button")}
//}
