//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Charuka on 2025-04-03.
//

import SwiftUI

struct CategoryRow: View {
    var CategoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(CategoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top,5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment:.top,spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }

                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    CategoryRow(
        CategoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(5)))
}
