//
//  OrdersView.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

struct OrdersView: View {
    
    
    @EnvironmentObject var orders: Orders
    @Namespace var nameSpace
    
    var body: some View {
        NavigationView{
            
            if orders.items.isEmpty {
                EmptyState()
            }
            else {
                
            VStack {
                List {
                    ForEach(orders.items) { item in
                       AppetizerListCell(item: item, nameSp: nameSpace)
                    }
                    .onDelete(perform: orders.remove)
                }
                .listStyle(.plain)
                Button (action: {} ) {
                    Text("$\(orders.totalPrice, specifier: "%.2f") - Place Order")
                        .font(.title3)
                        .padding(.horizontal) 
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .padding(.bottom, 25)
            }
                .navigationTitle("Orders")
        }
        }
    }
}

#Preview {
    OrdersView()
}
