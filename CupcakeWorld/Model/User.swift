//
//  User.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 17/03/26.
//

import Foundation

class User: ObservableObject {
    @Published var name: String
    @Published var addresses: [Address] = []
    @Published var activeAddress: Address?
    
    init(name: String, addresses: [Address]) {
        self.name = name
        self.addresses = addresses
        self.activeAddress = addresses.first(where: {$0.isActive})
    }
}
