//
//  grid_tile.swift
//  appleFrameworks
//
//  Created by Gautam Yadav on 04/11/23.
//
import SwiftUI

struct MyGridTile : View {
    
    var model : FrameworkModel
    
    var body: some View {
        VStack{
            Image(model.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(model.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .padding()
        }
    }
}


#Preview {
    MyGridTile(model: MockData.frameworks.first!)
}
