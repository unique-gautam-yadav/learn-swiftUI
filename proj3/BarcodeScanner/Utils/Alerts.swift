//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI


struct AlertItemModel: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext{
    static let invalidDevice = AlertItemModel(title: "Invalid Device", message: "Something is went wrong with the camera. We are unable to capture the input.", dismissButton: .default(Text("OK")))
    static let invalidScanType = AlertItemModel(title: "Invalid Image type", message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.", dismissButton: .default(Text("OK")))
}
