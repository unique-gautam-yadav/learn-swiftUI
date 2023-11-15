//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Orders()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
