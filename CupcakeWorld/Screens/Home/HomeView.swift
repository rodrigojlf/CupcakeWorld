//
//  HomeView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 13/03/26.
//

import SwiftUI

struct HomeView: View {
    @State private var presentCreateYourOwn: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                HomeHeaderView()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        HomeCarouselView()
                            .frame(height: 200)
                        HomeBestSellersView(cupcakes: Mock().cupcakes)
                        HomeCreateYourOwnView(action: { presentCreateYourOwn = true })
                        HomeAllCupcakesSectionView(viewModel: HomeAllCupcakesViewModel(cupcakes: Mock().cupcakes))
                        Spacer(minLength: 200)
                    }
                }
            }
            .background(.quinary)
            .fullScreenCover(isPresented: $presentCreateYourOwn) {
                CreateYourCupcakeView()
            }
        }
    }
}

#Preview {
    HomeView()
}
