//
//  EmptyState.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack{
            Image("empty-order")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .padding(.bottom, 40)
            Text("You have no items in your order.")
                .font(.title3)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
        .offset(y: -60)
    }
}

#Preview {
    EmptyState()
}
