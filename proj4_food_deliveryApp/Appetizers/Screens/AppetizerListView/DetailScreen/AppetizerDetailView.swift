//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var orders: Orders
    
   var model: AppetizerModel
   @Binding var detailShown: Bool
    var nameSpace: Namespace.ID
   
    var body: some View {
        VStack () {
            AppetizerRemoteImage(imageUrl: model.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
                .matchedGeometryEffect(id: model.id, in: nameSpace)
            
            Text(model.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
                

            Text(model.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            HStack ( spacing : 40 ) {
                DataStack(title: "Calories", data: "\(model.calories)")
                
                DataStack(title: "Carbs", data: "\(model.carbs)")
                
                DataStack(title: "Protein", data: "\(model.protein)")
            }
            .padding(.bottom, 30)
            
            Button(action: {
                
                orders.add(model)
                
                withAnimation(.spring) {
                    detailShown = false
                }
            }) {
                Text("$\(model.price, specifier: "%.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .padding(.bottom, 30)
            
        }
      
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button(action: {
                withAnimation(.spring) {
                    detailShown = false
                }
            }){
                ZStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.black)
                }
            },
            alignment: .topTrailing)
    }
}


struct DataStack : View{
    
    var title: String
    var data: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .bold()
            
            Text(data)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

