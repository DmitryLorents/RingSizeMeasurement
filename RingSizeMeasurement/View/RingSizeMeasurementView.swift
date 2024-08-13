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
                .padding(.horizontal, 20)
            
            
        }
        .padding()
    }
}

#Preview {
    RingSizeMeasurementView()
}
