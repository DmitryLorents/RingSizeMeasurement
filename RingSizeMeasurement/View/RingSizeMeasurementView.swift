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
    @State private var onboardingStep = 0
    private let roundMaskHeight: CGFloat = 280
    private let sliderMaskHeight: CGFloat = 60
    private let commentMaxHeightVerticalInset: CGFloat = 20
    private let onboardingCommentVerticalOffset: CGFloat = 10
    private var firstCommentOnboardingOffset: CGFloat {
        switch selectedTab {
        case 0:
            roundMaskHeight / 2 + onboardingCommentVerticalOffset
        case 1:
            viewModel.sizeInMM() / 2 + onboardingCommentVerticalOffset
        default:
            0
        }
    }
    private var secondCommentOnboardingOffset: CGFloat {
        sliderMaskHeight / 2 + onboardingCommentVerticalOffset
    }
    
    var body: some View {
        GeometryReader { geometry in
            let safeAreaTop = geometry.safeAreaInsets.top
            
            var maxCommentHeight: CGFloat {
                switch selectedTab {
                case 0:
                    geometry.frame(in: .global).height / 2 
                    - safeAreaTop
//                    - 2 * commentMaxHeightVerticalInset
                    - (roundMaskHeight / 2)
                case 1:
                    geometry.frame(in: .global).height / 2 - safeAreaTop - 2 * commentMaxHeightVerticalInset - (viewModel.sizeInMM() / 2)
                default:
                    0
                }
            } 
            
            
            VStack() {
                
                Picker("", selection: $selectedTab) {
                    // TODO: - make indexation by index.
                    ForEach(viewModel.model.tabs, id: \.self) { tabName in
                        let index = viewModel.model.tabs.firstIndex(of: tabName) ?? 0
                        Text(tabName).tag(index)
                    }
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 20)
                
                Text("Отрегулируйте красную область, чтобы она заняла все внутреннее пространство кольца")
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                
                
                Spacer()
                measurementView
                    .opacity(onboardingStep != 0 && selectedTab == 0 ? 0 : 1)
                    .padding(.horizontal, 0)
                    .overlay(
                        Image(.ring)
                            .opacity(onboardingStep != 0 && selectedTab == 0 ? 1 : 0)
                    )
                    .onboarding(
                        maxOnboardingSteps: 2,
                        onboardingStep: $onboardingStep,
                        enabled: onboardingStep == 1,
                        text: viewModel.model.onboardingText,
                        yOffset: firstCommentOnboardingOffset,
                        maxCommentHeight: maxCommentHeight
                    ) {
                        firstStepOnboardingMask
                    }
                Spacer()
                
                Text(
                    viewModel.formatSize()
                )
                
                Text("размер")
                
                SizeChangeView(
                    size: $viewModel.model.size,
                    sizeValues: viewModel.model.sizeValues,
                    step: 0.5
                ) {
                    viewModel.increaseSize()
                } decreaseAction: {
                    viewModel.decreaseSize()
                }
                .padding(.horizontal, 20)
                .valueChanged(value: viewModel.model.size, onChange: { _ in
                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                })
                .onboarding(
                    maxOnboardingSteps: 2,
                    onboardingStep: $onboardingStep,
                    enabled: onboardingStep == 2 && selectedTab != 1,
                    text: viewModel.model.onboardingText,
                    yOffset: secondCommentOnboardingOffset,
                    maxCommentHeight: maxCommentHeight
                ) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width - 24, height: sliderMaskHeight)
                }
                
                Button(action: {
                    onboardingStep = (onboardingStep + 1) % 3
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
}

#Preview {
    RingSizeMeasurementView()
}
