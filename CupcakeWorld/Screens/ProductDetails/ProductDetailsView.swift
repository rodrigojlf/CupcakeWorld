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
    @EnvironmentObject var user: User
    @Environment(\.dismiss) private var dismiss
    
    @State private var quantity: Int = 1
    @State private var totalPrice: Double = 0.0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                ProductDetailsHeroImageView(imageUrl: cupcake.imageUrl)
                VStack(alignment: .leading, spacing: 24) {
                    ProductDetailsHeader(cupcake: cupcake, user: user)
                    QuantitySelector(quantity: $quantity)
                }
                .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .overlay(alignment: .topLeading) {
            CustomBackButton {
                dismiss()
            }
        }
        .safeAreaInset(edge: .bottom) {
            AddToCartBarView(totalPrice: $totalPrice,
                             quantity: $quantity) {
                //TODO - Add to cart
                dismiss()
            }
        }
        .onAppear {
            tabBarManager.isHidden = true
            totalPrice = cupcake.price * Double(quantity)
        }
        .onDisappear {
            tabBarManager.isHidden = false
        }
        .onChange(of: quantity) { newValue in
            totalPrice = cupcake.price * Double(newValue)
        }
    }
}

#Preview {
    NavigationStack {
        ProductDetailsView(cupcake: Mock().cupcakes.first!)
            .environmentObject(TabBarManager())
            .environmentObject(Mock().user)
    }
}
