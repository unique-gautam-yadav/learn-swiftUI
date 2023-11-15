//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var code: String
    @Binding var alertItem: AlertItemModel?
    
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    typealias UIViewControllerType = ScannerVC
    
    final class Coordinator: NSObject, ScannerVCDelegate{
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
         
        private let scannerView: ScannerView
        
        func didFind(barcode: String) {
            scannerView.code = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDevice:
                scannerView.alertItem = AlertContext.invalidDevice
                break
            case .invalidScanValue:
                scannerView.alertItem = AlertContext.invalidScanType
                break
           
            }
        }
        
        
    }
}

#Preview {
    ScannerView(
        code: .constant("123123"),
        alertItem: .constant(nil))
}
