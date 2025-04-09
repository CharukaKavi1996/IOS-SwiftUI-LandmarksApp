//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Charuka on 2025-04-02.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet:Bool
    var body: some View {
        Button {
            isSet.toggle()
        }label: {
            Label("Toggle Fvaorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
