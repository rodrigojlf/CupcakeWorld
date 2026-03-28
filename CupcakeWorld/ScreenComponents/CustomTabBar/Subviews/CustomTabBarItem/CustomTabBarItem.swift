//
//  CustomTabBarItem.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 14/03/26.
//

import SwiftUI

struct CustomTabBarItem: View {
    @Binding var selectedTab: TabBar
    let tabItem: TabBar
    
    var body: some View {
        Button {
            selectedTab = tabItem
        } label: {
            if selectedTab == tabItem {
                Label(tabItem.title,
                      systemImage: tabItem.rawValue)
                .lineLimit(1)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background {
                    Capsule()
                        .fill(Color.clear)
                }
            } else {
                Image(systemName: tabItem.rawValue)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .tint(.gray)
            }
        }
    }
}
