//
//  TestesView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 14/03/26.
//

import SwiftUI

struct TestesView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    InfiniteCarouselView(data: Mock().banners)
}


struct InfiniteCarouselView: View {
    // Lista original de dados (aqui usando nomes de imagens ou cores/URLs)
    let data: [UIImage]
    
    // Estados que controlam a interface
    @State private var carouselItems: [UIImage] = []
    @State private var activeIndex: Int = 1 // Começa no 1, pois o index 0 será o "falso último"
    
    // Controle para evitar saltos bruscos se o usuário estiver arrastando rápido
    @State private var isDragging: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            if !carouselItems.isEmpty {
                TabView(selection: $activeIndex) {
                    ForEach(carouselItems.indices, id: \.self) { index in
                        Image(uiImage: carouselItems[index])
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .frame(maxWidth: 300, maxHeight: 200)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: activeIndex) { newIndex in
                    handleIndexChange(newIndex)
                }
            }
            customPageControl
        }
        .onAppear {
            setupCarouselItems()
        }
    }
        
    private var customPageControl: some View {
        HStack(spacing: 8) {
            ForEach(0..<data.count, id: \.self) { index in
                Circle()
                    .fill(currentRealIndex == index ? Color.primary : Color.secondary.opacity(0.4))
                    .frame(width: 8, height: 8)
                    .animation(.easeInOut(duration: 0.3), value: activeIndex)
            }
        }
    }
        
    /// Calcula qual é o índice real baseado no array modificado
    private var currentRealIndex: Int {
        if activeIndex == 0 {
            return data.count - 1
        } else if activeIndex == carouselItems.count - 1 {
            return 0
        } else {
            return max(0, activeIndex - 1)
        }
    }
    
    /// Prepara o array adicionando as "pontas falsas"
    private func setupCarouselItems() {
        guard !data.isEmpty else { return }
        var items = data
        
        // Insere o último no começo e o primeiro no final
        if let first = data.first, let last = data.last {
            items.insert(last, at: 0)
            items.append(first)
        }
        
        self.carouselItems = items
        self.activeIndex = 1
    }
    
    /// Gerencia o salto invisível quando o usuário atinge as pontas
    private func handleIndexChange(_ newIndex: Int) {
        let totalItems = carouselItems.count
        guard totalItems > 2 else { return }
        
        if newIndex == 0 {
            // Chegou no falso começo -> Pula para o último real
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                activeIndex = totalItems - 2
            }
        } else if newIndex == totalItems - 1 {
            // Chegou no falso fim -> Pula para o primeiro real
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                activeIndex = 1
            }
        }
    }
}

