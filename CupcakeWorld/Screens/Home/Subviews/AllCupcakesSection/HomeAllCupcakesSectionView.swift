//
//  HomeAllCupcakesSectionView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 22/03/26.
//

import SwiftUI

struct HomeAllCupcakesSectionView: View {
    @ObservedObject var viewModel: HomeAllCupcakesViewModel
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Nosso Menu 🧁")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Menu {
                    Picker("Filtro", selection: $viewModel.selectedFilter) {
                        ForEach(FilterOption.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .accessibilityLabel("Filtrar cupcakes")
                }
                
                Menu {
                    Picker("Ordenação", selection: $viewModel.selectedSort) {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .accessibilityLabel("Ordenar cupcakes")
                }
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.displayedCupcakes) { cupcake in
                    CupcakeGridItemView(cupcake: cupcake)
                }
            }
            .padding(.horizontal)
            
            if viewModel.displayedCupcakes.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text("Nenhum cupcake encontrado para este filtro.")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.top, 30)
            }
        }
    }
}

#Preview {
    ScrollView {
        HomeAllCupcakesSectionView(viewModel: HomeAllCupcakesViewModel(cupcakes: Mock().cupcakes))
    }
}
