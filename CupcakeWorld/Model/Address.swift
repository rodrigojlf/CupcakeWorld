//
//  Address.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 17/03/26.
//

import Foundation

struct Address: Equatable, Identifiable {
    var id: UUID = UUID()
    var street: String
    var number: String
    var complement: String?
    var city: String
    var state: String
    var zipCode: String
    var country: String
    var name: String?
    var type: String
    var instructions: String?
    var isActive: Bool = false
    
    var wrappedAddressShort: String {
        "\(street), \(number)"
    }
    
}

enum AddressType: String, CaseIterable {
    case home
    case work
    case other
}
