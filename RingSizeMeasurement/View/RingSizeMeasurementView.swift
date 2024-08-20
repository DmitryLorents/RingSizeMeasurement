//
//  ContentView.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 13.08.2024.
//

import SwiftUI

struct RingSizeMeasurementView: View {
    @StateObject private var viewModel = RingSizeMeasurementViewModel()
    @State private var selectedTab = 0
    @State var onboardingStep = 0
    @State var measuredFrame: CGRect = .zero
    private let roundMaskHeight: CGFloat = 280
    private let sliderMaskHeight: CGFloat = 60
    private let horizontalInset: CGFloat = 20
    private let verticalInset: CGFloat = 20
    private var firstCommentOnboardingOffset: CGFloat {
        switch selectedTab {
        case 0:
            return roundMaskHeight / 2
        case 1:
            return viewModel.sizeInMM() / 2
        default:
            return 0
        }
    }
    private var secondCommentOnboardingOffset: CGFloat {
        sliderMaskHeight / 2
    }
    
    var body: some View {
        GeometryReader { geometry in
                        let safeAreaTop = geometry.safeAreaInsets.top
            
            let maxCommentHeight: CGFloat = UIScreen.main.bounds.height / 2 - safeAreaTop - 2 * horizontalInset - (roundMaskHeight / 2)
            
            
            VStack {
                
                Picker("", selection: $selectedTab) {
                    // TODO: - make indexation by index.
                    ForEach(viewModel.model.tabs, id: \.self) { tabName in
                        let index = viewModel.model.tabs.firstIndex(of: tabName) ?? 0
                        Text(tabName).tag(index)
                    }
                    
                }
                .pickerStyle(.segmented)
                
                Text("Отрегулируйте красную область, чтобы она заняла все внутреннее пространство кольца")
                    .padding(.vertical, 16)
                
                
                Spacer()
                measurementView
                    .overlay(
                        Image(.ring)
                            .opacity(onboardingStep == 1 && selectedTab == 0 ? 1 : 0)
                    )
                    .onboarding(enabled: onboardingStep == 1, yOffset: firstCommentOnboardingOffset, maxCommentHeight: maxCommentHeight) {
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
                .valueChanged(value: viewModel.model.size, onChange: { _ in
                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                })
                .onboarding(
                    enabled: onboardingStep == 2 && selectedTab != 1,
                    yOffset: secondCommentOnboardingOffset,
                    maxCommentHeight: maxCommentHeight
                ) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width - 24, height: sliderMaskHeight)
                }
                
                Button(action: {
                    onboardingStep = (onboardingStep + 1) % 3
                    print("Apply size \(viewModel.formatSize())")
                    print("Bounds: ", UIScreen.main.bounds)
                    print("nativeBounds: ", UIScreen.main.nativeBounds)
                    print("Scale: ", UIScreen.main.scale)
                    print("nativeScale: ", UIScreen.main.nativeScale)
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
                
            }
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder var firstStepOnboardingMask: some View {
        if selectedTab == 0 {
            Circle()
                .frame(height: roundMaskHeight)
        } else {
            Rectangle()
                .frame(width: 10_000, height: viewModel.sizeInMM())
            
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
