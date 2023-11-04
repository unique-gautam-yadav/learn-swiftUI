//
//  ContentView.swift
//  appleFrameworks
//
//  Created by Gautam Yadav on 04/11/23.
//

import SwiftUI

struct HomeScreen: View {
    
    //    var columns =;
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns:  [GridItem(),GridItem(),GridItem(),], content  : {
                    ForEach(MockData.frameworks, id: \.name, content:{ model in
                        NavigationLink (
                            destination: DetailView(model: model),
                            label: { MyGridTile(model: model) }
                        )
                    })
                })
            }.navigationTitle("🍏 Frameworks")
        }.accentColor(Color(.label))
    }
}

#Preview {
    HomeScreen()
}
