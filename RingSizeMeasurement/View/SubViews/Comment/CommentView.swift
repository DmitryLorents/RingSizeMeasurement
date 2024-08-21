//
//  CommentView2.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView: View {
    @Binding private var onboardingStep: Int
    var horizontalOffset: CGFloat
    let text: String
    var maxOnboardingSteps: Int
    var closeButtonAction: (() -> Void)?
    
    init(horizontalOffset: CGFloat = 20,
         onboardingStep: Binding<Int>,
         text: String,
         maxOnboardingSteps: Int,
         closeButtonAction: (() -> Void)? = nil
    ) {
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
 
    @ViewBuilder var buttons: some View {
        switch onboardingStep {
        case 1:
            OnboardingButtonView(
                action: {
                    nextButtonAction()
                },
                label: darkButtonText,
                buttonType: .dark
            )
        case 2:
            OnboardingButtonView(
                action: {
                    previousButtonAction()
                },
                label: "Назад",
                buttonType: .light
            )
            
            OnboardingButtonView(
                action: {
                    nextButtonAction()
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
    
    func nextButtonAction() -> Void {
        onboardingStep = (onboardingStep + 1) % (maxOnboardingSteps + 1)
    }
}
