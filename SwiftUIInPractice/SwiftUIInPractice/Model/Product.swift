//
//  Product.swift
//  
//
//  Created by Sahana  Rao on 04/09/24.
//

import Foundation

// MARK: - ProductArray
struct ProductArray : Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description, category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let images: [String]
    let thumbnail: String
    var firstImage : String {
        return images.first ?? Constants.randomImageURL
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Example product title",
            description: "Mock product description",
            category: "Electronic device",
            price: 999,
            discountPercentage: 15,
            rating: 4,
            stock: 3,
            tags: ["Tag 1", "Tag 2", "Tag 3"],
            brand: "Apple",
            images: [Constants.randomImageURL, Constants.randomImageURL, Constants.randomImageURL],
            thumbnail: Constants.randomImageURL
        )
    }
}

struct ProductRow : Identifiable {
    let id = UUID().uuidString
    let title : String
    let products : [Product]
}
