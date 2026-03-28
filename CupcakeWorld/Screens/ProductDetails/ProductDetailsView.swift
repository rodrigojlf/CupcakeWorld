//
//  ProductDetailsView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 27/03/26.
//

import SwiftUI

struct ProductDetailsView: View {
    let cupcake: Cupcake
    @EnvironmentObject private var tabBarManager: TabBarManager
    
    var body: some View {
        //TODO - develop the view.
        VStack {
            Text(cupcake.name)
                .font(.headline)
        }
        .onAppear {
            tabBarManager.isHidden = true
        }
        .onDisappear {
            tabBarManager.isHidden = false
        }
    }
}

#Preview {
    ProductDetailsView(cupcake: Mock().cupcakes.first!)
        .environmentObject(TabBarManager())
}
