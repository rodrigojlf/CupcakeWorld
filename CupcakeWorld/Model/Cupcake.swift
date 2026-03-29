//
//  Cupcake.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 22/03/26.
//

import Foundation

struct Cupcake: Identifiable {
    let id: UUID = UUID()
    let name: String
    let price: Double
    let imageUrl: String
    let categories: Array<String> // ["premium", "party", "vegan"]
    let details: String
    let tags: Array<String> // ["bestSeller", "recomended", "discount"]
}
