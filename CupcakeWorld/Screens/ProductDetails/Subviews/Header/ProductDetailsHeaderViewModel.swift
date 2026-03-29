//
//  ProductDetailsHeaderViewModel.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 29/03/26.
//

import SwiftUI

class ProductDetailsHeaderViewModel: ObservableObject {
    let cupcake: Cupcake
    private var user: User
    
    @Published var isFavorite: Bool
    
    var formattedPrice: String {
        cupcake.price.formatted(.currency(code: "BRL"))
    }
    
    init(cupcake: Cupcake, user: User) {
        self.cupcake = cupcake
        self.user = user
        self.isFavorite = user.favoriteCupcakesIds.contains(cupcake.id.uuidString)
    }
    
    func toggleFavorite() {
        withAnimation(.spring()) {
            isFavorite.toggle()
        }
        
        if isFavorite {
            user.favoriteCupcakesIds.append(cupcake.id.uuidString)
        } else {
            user.favoriteCupcakesIds.removeAll { $0 == cupcake.id.uuidString }
        }
    }
}
