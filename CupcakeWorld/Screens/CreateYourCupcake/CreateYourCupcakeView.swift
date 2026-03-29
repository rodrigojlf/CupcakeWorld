//
//  CreateYourCupcakeView.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 27/03/26.
//

import SwiftUI

struct CreateYourCupcakeView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //TODO - develop the view
        VStack {
            HStack(alignment: .center) {
                CustomBackButton { dismiss() }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            VStack {
                Text("Create Your Own Cupcake!")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    CreateYourCupcakeView()
}
