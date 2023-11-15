//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                ScannerView(code: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder" )
                    .font(.title)
                
                
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusColor)
                    .padding()
            }
            .padding()
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem ) { alert in
                Alert(title: Text(alert.title), message: Text(alert.message), dismissButton: alert.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
