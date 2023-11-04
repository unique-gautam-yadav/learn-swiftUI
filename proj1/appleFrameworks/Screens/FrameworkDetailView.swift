//
//  FrameworkDetailView.swift
//  appleFrameworks
//
//  Created by Gautam Yadav on 04/11/23.
//

import SwiftUI

struct DetailView : View {
    var model: FrameworkModel
    
    @State private var isSheetShown = false
    
    var body: some View{
        VStack {
            MyGridTile(model: model)
            
            Spacer()
            
            Text(model.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: URL(string: model.urlString)!, label: {
                Label(
                    title: { Text("Learn More") },
                    icon: { Image(systemName:"paperplane.fill") }
                )
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 280, height: 50)
                
                
            })
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
        }
    }
}

#Preview {
    DetailView(model: MockData.sampleFramework)
}
