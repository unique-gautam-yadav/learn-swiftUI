//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import SwiftUI

struct AppetizerListCell: View {
    
    var item: AppetizerModel
    var nameSp: Namespace.ID
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(imageUrl: item.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(10)
                .matchedGeometryEffect(id: item.id, in: nameSp)
              
            VStack (alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$ \(item.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}



struct NetworkImageView: View {
    let imageURL: String // The URL of the image

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                                .resizable()
                                .aspectRatio(contentMode: .fill)

            case .failure:
                Image("img3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            default:
                ProgressView()
            }
        }
        .frame(width: 160, height: 100, alignment: .leading)
    }
}

