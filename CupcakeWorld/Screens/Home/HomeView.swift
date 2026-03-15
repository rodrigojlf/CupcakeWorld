//
//  HomeView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 13/03/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                CarouselView()
                    .frame(height: 200)
                    .padding(.top, 24)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
