//
//  DatabaseHelper.swift
//  
//
//  Created by Sahana  Rao on 04/09/24.
//

import Foundation

struct DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://dummyjson.com/products") else  {
            throw URLError(.badURL)
        }
        let (data, _) =  try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
        
    }
    
    func getUsers() async throws -> [User] {
        
        guard let url = URL(string: "https://dummyjson.com/users") else  {
            throw URLError(.badURL)
        }
        let (data, _) =  try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserList.self, from: data)
        return users.users
        
    }
}
