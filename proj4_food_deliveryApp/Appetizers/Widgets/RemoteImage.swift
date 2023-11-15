//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load (imgageURL url: String) {
        NetworkManager.shared.downloadImage(imageUrl: url) { uiImage in
            guard let uiImage = uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    var img : Image?
    
    var body: some View {
        img?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    
    @StateObject var imageLoader = ImageLoader()
    let imageUrl: String
    
    var body: some View {
        RemoteImage(img: imageLoader.image)
            .onAppear { imageLoader.load(imgageURL: imageUrl) }
    }
}
