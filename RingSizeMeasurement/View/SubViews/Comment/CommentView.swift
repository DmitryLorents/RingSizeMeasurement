//
//  CommentView2.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 15.08.2024.
//

import SwiftUI

struct CommentView<Buttons: View>: View {
    @State private var frame: CGRect = .zero
    @Binding private var onboardingStep: Int
    let horizontalOffset: CGFloat
    let text: String
    let maxOnboardingSteps: Int
    let closeButtonAction: (() -> Void)?
    private let buttonsContent: () -> Buttons
    
    init(
        onboardingStep: Binding<Int>,
        horizontalOffset: CGFloat = 20,
         text: String,
         maxOnboardingSteps: Int,
         closeButtonAction: (() -> Void)? = nil,
        @ViewBuilder buttons: @escaping () -> Buttons
    ) {
        self.horizontalOffset = horizontalOffset
        self.text = text
        self.maxOnboardingSteps = maxOnboardingSteps
        _onboardingStep = onboardingStep
        self.closeButtonAction = closeButtonAction
        buttonsContent = buttons
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
//                            buttons
                            buttonsContent()
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
            .background(
                GeometryReader { geometry -> Color in
                    Task {
                        frame = geometry.frame(in: .local)
                    }
                    return Color.clear
                }
            )
            .offset(y: -frame.height/2)
    }
        
    
    var onboardingSliderImage: ImageResource {
        onboardingStep == 1 ? .onboardingSlider1 : .onboardingSlider2
    }
    
    var darkButtonText: String {
        maxOnboardingSteps == onboardingStep ? "Понятно" : "Далее"
    }
//    var buttonsFromContent: some View {
//        buttonsContent
//            
//    }
 
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
