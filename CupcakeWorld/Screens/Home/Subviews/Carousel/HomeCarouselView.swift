//
//  HomeCarouselView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 14/03/26.
//

import SwiftUI

struct HomeCarouselView: View {
    @StateObject private var viewModel = HomeCarouselViewModel()
    
    var body: some View {
        VStack {
            if !viewModel.displayBanners.isEmpty {
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(viewModel.displayBanners.indices, id: \.self) { index in
                        Image(uiImage: viewModel.displayBanners[index])
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .tag(index)
                            .onTapGesture {
                                viewModel.bannerTapped()
                            }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: viewModel.currentIndex) { newIndex in
                    viewModel.handleIndexChange(newIndex)
                }
                .navigationDestination(isPresented: $viewModel.navigateToDetails) {
                    //TODO - develop the view for promotions
                    Text("Promotion Details Screen to be implemented.")
                }
            }
        }
        .onAppear {
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.stopTimer()
        }
    }
}

#Preview {
    HomeCarouselView()
}
