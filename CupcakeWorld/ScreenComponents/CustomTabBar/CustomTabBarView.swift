//
//  CustomTabBarView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 14/03/26.
//

import SwiftUI

struct CustomTabBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab: TabBar = .home
    @Namespace private var animation
    @StateObject private var tabBarManager = TabBarManager()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .order:
                    OrderView()
                case .settings:
                    SettingsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environmentObject(tabBarManager)
            
            customTabBar()
                .offset(y: tabBarManager.isHidden ? 150 : 0)
                .opacity(tabBarManager.isHidden ? 0 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: tabBarManager.isHidden)
                .edgesIgnoringSafeArea(.bottom)
        }
        .ignoresSafeArea(.keyboard)
    }
    
    @ViewBuilder
    func customTabBar() -> some View {
        HStack {
            ForEach(TabBar.allCases, id: \.self) { tab in
                CustomTabBarItem(selectedTab: $selectedTab, tabItem: tab)
                    .background {
                        if selectedTab == tab {
                            Capsule()
                                .fill(colorScheme == .dark ? Color.blue.gradient : Color.cyan.gradient)
                                .contentShape(.rect)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .animation(.smooth(duration: 0.3, extraBounce: 0.45), value: selectedTab)
            }
            
        }
        .tint(.primary)
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background(
            Material.thin
                .shadow(.drop(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5))
                .shadow(.drop(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)),
            in: .capsule
        )
    }
}

#Preview {
    CustomTabBarView()
}
