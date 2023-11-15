//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    @Namespace var listView
    
    var body: some View {
        ZStack {
            NavigationView {
                
                if viewModel.isLoading {
                    ProgressView("Loading data...")
                        .controlSize(.large)
                        .progressViewStyle(CircularProgressViewStyle(tint: .primary))
                } else {
                    List(viewModel.appetizers, id: \.id) { item in
                        AppetizerListCell(item: item, nameSp: listView)
                            .onTapGesture {
                                withAnimation (.spring) {
                                    viewModel.selectedItem = item
                                    viewModel.detailShown = true
                                }
                            }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Appetizers")
                    .disabled(viewModel.detailShown)
                }
            }
            .task {
                viewModel.getData()
            }
            .blur(radius: viewModel.detailShown ? 20 : 0)
            
            if viewModel.detailShown {
                AppetizerDetailView(model: viewModel.selectedItem!, detailShown: $viewModel.detailShown, nameSpace: listView)
            }
        }
        .alert(item: $viewModel.alert) { alert in
                        Alert(title: alert.title,
                              message: alert.description,
                              dismissButton: alert.dismissButton)
        }
    }
    
}


