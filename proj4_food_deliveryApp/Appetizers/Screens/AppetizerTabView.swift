//
//  ContentView.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var orders: Orders
    
    var body: some View {
        TabView{
            AppetizerListView().tabItem { Label("Home", systemImage: "house") }
            OrdersView().tabItem { Label("Orders", systemImage: "cart") }.badge(orders.items.count)
            AccountView().tabItem { Label("Account", systemImage: "person.circle") }
        }
    }
}

#Preview {
    AppetizerTabView()
}

