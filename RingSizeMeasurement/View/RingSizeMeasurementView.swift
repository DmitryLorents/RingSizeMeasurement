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
    @State var onboardingStep = 0 //viewModel.model.onboardingStep
    @State var measuredFrame: CGRect = .zero
    
    
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                ForEach(viewModel.model.tabs, id: \.self) { tabName in
                    let index = viewModel.model.tabs.firstIndex(of: tabName) ?? 0
                    Text(tabName).tag(index)
                }
                
            }
            .pickerStyle(.segmented)
            
            Text("Отрегулируйте красную область, чтобы она заняла все внутреннее пространство кольца")
                .padding(.vertical, 16)
            
            
//            Image(.ring)
//                .mask(
//                    Text("SwiftUI")
//                        .font(.largeTitle)
//                        .bold()
//                )
            
            Spacer()
            measurementView
//                .modifier(CoordinateSpaceFrameProvider(shouldIgnore: onboardingStep != 1, coordinateSpace: .local, frame: { frame in
//                    print("Frame1=", frame)
//                    measuredFrame = frame
//                }))
//                .opacity(onboardingStep == 0 ? 1 : 0)
                .overlay(
                    Image(.ring)
                        .opacity(onboardingStep == 1 ? 1 : 0)
                )
                .onboarding(enabled: onboardingStep == 1, yOffset: -140) {
                    Circle()
                        .frame(height: 280)
                        
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
//            .modifier(CoordinateSpaceFrameProvider(shouldIgnore: onboardingStep != 2, coordinateSpace: .local, frame: { frame in
//                print("Frame2=", frame)
//                measuredFrame = frame
//            }))
            .onboarding(enabled: onboardingStep == 2, yOffset: -30) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.width - 24, height: 60)
            }
            
            Button(action: {
//                viewModel.nextStep()
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
        .onAppear(perform: {
            UISlider.appearance().minimumTrackTintColor = .pinkApp
            UISlider.appearance().setThumbImage(.thumbUnselected, for: .normal)
            UISlider.appearance().setThumbImage(.thumbSelected, for: .highlighted)
        })
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
