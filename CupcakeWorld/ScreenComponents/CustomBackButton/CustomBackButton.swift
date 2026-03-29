//
//  CustomBackButton.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 29/03/26.
//

import SwiftUI

struct CustomBackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .font(.title3)
                .bold()
                .tint(.primary)
                .padding(12)
                .background(.ultraThinMaterial, in: Circle())
        }
        .padding(.leading, 20)
    }
}

#Preview {
    CustomBackButton() { }
}
