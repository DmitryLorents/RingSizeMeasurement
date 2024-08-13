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
            
            Spacer()
            
            Image(.ring)
            
            Spacer()
            
            VStack {
                Text(
                    viewModel.formatSize()
                )
                Text("размер")
                HStack {
                    Button(action: {
                        viewModel.decreaseSize()
                    }, label: {
                        Text("-")
                    })
                    Slider(value: $viewModel.model.size, in: 12...24, step: 0.5) { _ in}
                    Button(action: {
                        viewModel.increaseSize()
                    }, label: {
                        Text("+")
                    })
                }
            }
            
            Button(action: {
                print("Apply size action")
            }, label: {
                Spacer()
                Text("Применить размер")
                    .foregroundStyle(.white)
                Spacer()
            })
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 56)
            )
            .padding(.vertical, 28)
//            .padding(.horizontal, 16)
            
        }
        .padding(.horizontal, 20)
        .onAppear(perform: {
            UISlider.appearance().minimumTrackTintColor = .pinkApp
        })
    }
}

#Preview {
    RingSizeMeasurementView()
}
