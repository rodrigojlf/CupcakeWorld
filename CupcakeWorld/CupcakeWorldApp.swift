//
//  CupcakeWorldApp.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 13/03/26.
//

import SwiftUI

@main
struct CupcakeWorldApp: App {
    @StateObject private var user: User = Mock().user
    
    var body: some Scene {
        WindowGroup {
            CustomTabBarView()
                .environmentObject(user)
        }
    }
}
