//
//  HomeAllCupcakesViewModel.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 27/03/26.
//

import Foundation

@MainActor
final class HomeAllCupcakesViewModel: ObservableObject {
    private let allCupcakes: [Cupcake]
    
    @Published var selectedSort: SortOption = .none
    @Published var selectedFilter: FilterOption = .all
    
    init(cupcakes: [Cupcake]) {
        self.allCupcakes = cupcakes
    }
    
    var displayedCupcakes: [Cupcake] {
        var result = allCupcakes
        
        if selectedFilter != .all {
            result = result.filter { $0.category == selectedFilter.rawValue }
        }
        
        switch selectedSort {
        case .recomended:
            break
            
        case .lowestPrice:
            result.sort { $0.price < $1.price }
            
        case .highestPrice:
            result.sort { $0.price > $1.price }
            
        case .nameAZ:
            result.sort { $0.name.localizedStandardCompare($1.name) == .orderedAscending }
        case .none:
            break
        }
        
        return result
    }
}
