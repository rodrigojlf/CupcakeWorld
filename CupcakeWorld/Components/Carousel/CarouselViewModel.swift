//
//  CarouselViewModel.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 15/03/26.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published var displayBanners: [UIImage] = []
    @Published var currentIndex: Int = 1
    @Published var navigateToDetails: Bool = false
    
    private let originalBanners: [UIImage]
    private var autoPlayTimer: Timer?
    
    init(banners: [UIImage] = Mock().banners) {
        self.originalBanners = banners
        setupCarouselItems()
    }
    
    private func setupCarouselItems() {
        guard !originalBanners.isEmpty else { return }
        
        var items = originalBanners
        
        if originalBanners.count > 1,
           let first = originalBanners.first,
           let last = originalBanners.last {
            items.insert(last, at: 0)
            items.append(first)
        }
        
        self.displayBanners = items
        self.currentIndex = originalBanners.count > 1 ? 1 : 0
    }
        
    func bannerTapped() {
        navigateToDetails = true
    }
    
    func handleIndexChange(_ newIndex: Int) {
        startTimer()
        
        let totalItems = displayBanners.count
        guard totalItems > 2 else { return }
        
        if newIndex == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.currentIndex = totalItems - 2
            }
        } else if newIndex == totalItems - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.currentIndex = 1
            }
        }
    }
        
    func startTimer() {
        stopTimer()
        
        autoPlayTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            self?.goToNextBanner()
        }
    }
    
    func stopTimer() {
        autoPlayTimer?.invalidate()
        autoPlayTimer = nil

    }
    
    private func goToNextBanner() {
        let totalItems = displayBanners.count
        guard totalItems > 2 else { return }
        
        withAnimation(.easeInOut(duration: 0.5)) {
            currentIndex += 1
        }
    }
}
