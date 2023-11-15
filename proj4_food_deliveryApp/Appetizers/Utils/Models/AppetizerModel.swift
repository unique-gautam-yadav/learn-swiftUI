//
//  Appetizer.swift
//  Appetizers
//
//  Created by Gautam Yadav on 05/11/23.
//

import Foundation

struct AppetizerModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
    
}


struct AppetizerResponse: Decodable {
      let request: [AppetizerModel]
}

struct MockData{
    static let sampleAppetizer1 = AppetizerModel(
        id: 001,
        name: "Test Appetizer",
        description: "the dummy description of the appetizers and the product is the best",
        price: 9.99,
        imageURL: "img1",
        calories: 99,
        protein: 23,
        carbs: 89
    )
    static let sampleAppetizer2 = AppetizerModel(
        id: 002,
        name: "Test Appetizer",
        description: "the dummy description of the appetiser and the product is the best",
        price: 9.99,
        imageURL: "img2",
        calories: 99,
        protein: 23,
        carbs: 89
    )
    
    static let sampleAppetizer3 = AppetizerModel(
        id: 003,
        name: "Test Appetizer",
        description: "the dummy description of the appetiser and the product is the best",
        price: 9.99,
        imageURL: "img3",
        calories: 99,
        protein: 23,
        carbs: 89
    )
    
    static let items = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
}
