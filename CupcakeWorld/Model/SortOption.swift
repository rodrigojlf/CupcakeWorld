//
//  SortOption.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 26/03/26.
//

import Foundation

enum SortOption: String, CaseIterable {
    case recomended = "Recomendados"
    case lowestPrice = "Menor Preço"
    case highestPrice = "Maior Preço"
    case nameAZ = "Nome (A-Z)"
    case none = "Nenhum"
}
