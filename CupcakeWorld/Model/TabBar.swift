//
//  TabBar.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 13/03/26.
//

import Foundation

enum TabBar: String, CaseIterable {
    case home = "house"
    case order = "cart"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .order:
            return "Order"
        case .settings:
            return "Settings"
        }
    }
}
