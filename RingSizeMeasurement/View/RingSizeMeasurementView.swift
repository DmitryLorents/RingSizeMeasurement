//
//  ContentView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 13.08.2024.
//

import SwiftUI
import UIKit

struct RingSizeMeasurementView: View {
    @StateObject private var viewModel = RingSizeMeasurementViewModel()
    @State private var selectedTab = 0
    @State private var current: Float = 15
    @State private var scale: CGFloat = 1
    @State private var scaleValue: CGFloat = 0
    @State private var zoomStep: CGFloat = 0.5
    let minZoom: CGFloat = 12
    let maxZoom: CGFloat = 24
//    @State private var onboardingStep = 0
    private let roundMaskHeight: CGFloat = 280
    private let sliderMaskHeight: CGFloat = 60
    private let commentMaxHeightVerticalInset: CGFloat = 20
    private let onboardingCommentVerticalOffset: CGFloat = 10
    private let values: [Float] = [12.0, 12.5, 13, 13.5, 15, 15.3, 16, 16.5, 17, 18]
    private var maxOnboardingSteps: Int {
        selectedTab == 0 ? 2 : 1
    }
    private var firstCommentOnboardingOffset: CGFloat {
        switch selectedTab {
        case 0:
            roundMaskHeight / 2 + onboardingCommentVerticalOffset
        case 1:
            viewModel.sizeInMM() / 2  + onboardingCommentVerticalOffset
        default:
            0
        }
    }
    private var secondCommentOnboardingOffset: CGFloat {
        sliderMaskHeight / 2
    }
    
    var body: some View {
        GeometryReader { geometry in
            let safeAreaTop = geometry.safeAreaInsets.top
            
            var maxCommentHeight: CGFloat {
                
                let maskHeight = viewModel.onboardingStep == 1 ? roundMaskHeight : sliderMaskHeight
                let height: CGFloat = switch selectedTab {
                case 0:
                    geometry.frame(in: .global).height / 2
                    - safeAreaTop
                    - 2 * commentMaxHeightVerticalInset
                    - (maskHeight / 2)
                case 1:
                    geometry.frame(in: .global).height / 2
                    - safeAreaTop
                    - 2 * commentMaxHeightVerticalInset
                    - (viewModel.sizeInMM() / 2)
                default:
                    0
                }
                
                return height
            }
            
            
            VStack() {
                
                HStack {
                    Image(.arrowLeft)
                    Spacer()
                    Text("Screen title")
                        .bold()
                    Spacer()
                    Button(action: {}, label: {
                        Image(.infoButton)
                    })
                }
                .padding(.horizontal, 20)
                
                Picker("", selection: $selectedTab) {
                    // TODO: - make indexation by index.
                    ForEach(viewModel.model.tabs, id: \.self) { tabName in
                        let index = viewModel.model.tabs.firstIndex(of: tabName) ?? 0
                        Text(tabName).tag(index)
                    }
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 20)
                Group {
                    DiscreteSlider(value: $current, in: values)
                    
                    Button(action: {
                        let index = values.firstIndex(where: { $0 == current}) ?? 0
                        if index > 0 {
                            current = values[index - 1]
                        }
                    }, label: {
                        Text("Button")
                    })
                    
                    Text("\(current)")
                }
                .padding(.horizontal, 20)
                Text("Отрегулируйте красную область, чтобы она заняла все внутреннее пространство кольца. Onboarding step: ")
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                
                
                Spacer()
                measurementView
//                        .accessibilityZoomAction { action in
//                            <#code#>
//                        }
                    .opacity(viewModel.onboardingStep != 0 && selectedTab == 0 ? 0 : 1)
                    .padding(.horizontal, 0)
                    .overlay(
                        Image(.ring)
                            .opacity(viewModel.onboardingStep != 0 && selectedTab == 0 ? 1 : 0)
                    )
                    .onboarding(
                        maxOnboardingSteps: maxOnboardingSteps,
                        onboardingStep: $viewModel.onboardingStep,
                        enabled: viewModel.onboardingStep == 1,
                        text: getOnboardingText(),
                        yOffset: firstCommentOnboardingOffset,
                        maxCommentHeight: maxCommentHeight
                    ) {
                        firstStepOnboardingMask
                    } buttons: {
                        OnboardingButtonView(
                            action: {
                                //                                previousButtonAction()
                            },
                            label: "Назад",
                            buttonType: .light
                        )
                        
                        OnboardingButtonView(
                            action: {
                                //                                nextButtonAction()
                            },
                            label: "Понятно",
                            buttonType: .dark
                        )
                    }
                Spacer()
                
                Text(
                    viewModel.formatSize()
                )
                
                Text("размер")
                
                SliderStepperView(
                    value: $viewModel.model.size,
                    in: viewModel.model.sizeValues,
                    accentColor: .pinkApp
                )
                .padding(.horizontal, 20)
                .valueChanged(value: viewModel.model.size, onChange: { _ in
                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                })
                .onboarding(
                    maxOnboardingSteps: maxOnboardingSteps,
                    onboardingStep: $viewModel.onboardingStep,
                    enabled: viewModel.onboardingStep == 2 && selectedTab != 1,
                    text: getOnboardingText(),
                    yOffset: secondCommentOnboardingOffset,
                    maxCommentHeight: maxCommentHeight
                ) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width - 24, height: sliderMaskHeight)
                } buttons: {
                    OnboardingButtonView(
                        action: {
                            //                                previousButtonAction()
                        },
                        label: "Назад",
                        buttonType: .light
                    )
                    
                    OnboardingButtonView(
                        action: {
                            //                                nextButtonAction()
                        },
                        label: "Понятно",
                        buttonType: .dark
                    )
                }
                
                Button(action: {
                    viewModel.onboardingStep = (viewModel.onboardingStep + 1) % (maxOnboardingSteps + 1)
                    print("Apply size \(viewModel.formatSize())")
                }, label: {
                    Spacer()
                    Text("Применить размер")
                        .foregroundColor(.white)
                    Spacer()
                })
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 56)
                )
                .zIndex(1)
                .padding(.vertical, 28)
                .padding(.horizontal, 20)
                
            
                
               
        }
            
        }
        .background(
            Color.white.opacity(0.0001)
                .gesture(
                    MagnificationGesture()
                    .onChanged({ 
                        updateScale($0)
                    })
                )
        )
        
    }
    
    @ViewBuilder var firstStepOnboardingMask: some View {
        if selectedTab == 0 {
            Circle()
                .frame(height: roundMaskHeight)
        } else {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: viewModel.sizeInMM())
            
        }
    }
    
    @ViewBuilder var measurementView: some View {
        switch selectedTab {
        case 0 :
            DiameterMeasurementView(size: $viewModel.model.sizeInMM)
        case 1:
            FingerMeasurementView(size: $viewModel.model.sizeInMM)
        default:
            EmptyView()
        }
    }
    
    private func getOnboardingText() -> String {
        let index =  switch (viewModel.onboardingStep, maxOnboardingSteps) {
        case (1,2):
            0
      case (2,2):
          1
      case (1,1):
          2
      default: 0
        }
        let texts = viewModel.model.onboardingTexts
        guard index < texts.count else {return ""}
        return texts[index]
    }
    
    private var navigationBar: some View {
        HStack {
            Image(.arrowLeft)
            Spacer()
            Text("Screen title")
                .bold()
            Spacer()
            Button(action: {}, label: {
                Image(.infoButton)
            })
        }
        .frame(height: 48)
    }
    
    private func updateScale(_ scale: MagnificationGesture.Value) {
        
        let zoomIn = scale > scaleValue ? false : true
        scaleValue = scale
        viewModel.magnificationCounter += 1

        if viewModel.magnificationCounter > 7 {
            viewModel.magnificationCounter = 0
            if zoomIn {
                viewModel.decreaseSize()
            } else {
                viewModel.increaseSize()
            }
        }

     }
}

#Preview {
    RingSizeMeasurementView()
}
