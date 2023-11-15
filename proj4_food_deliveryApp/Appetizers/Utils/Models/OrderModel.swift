//
//  OrderModel.swift
//  Appetizers
//
//  Created by Gautam Yadav on 12/11/23.
//

import SwiftUI

final class Orders: ObservableObject {
    @Published var items: [AppetizerModel] = []
    
    
    
    func add (_ model: AppetizerModel){
        items.append(model)
    }
    
    
    func remove (at offesets: IndexSet){
        items.remove(atOffsets: offesets)
    }
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
}
