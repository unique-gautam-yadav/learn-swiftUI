//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode: String = ""
    @Published var alertItem: AlertItemModel?
    
    var statusText: String {
        return scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
    
    var statusColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}
