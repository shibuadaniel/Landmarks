//
//  CategoryHome.swift
//  Landmarks
//
//  Created by SHIBU DANIEL on 10/8/20.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]]{
            Dictionary(
                grouping: landmarkData, by: { $0.category.rawValue }
            )
    }
    
    var featured: [Landmark] {
        landmarkData.filter {$0.isFeatured}
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                ForEach(categories.keys.sorted(), id: \.self) { key in CategoryRow(categoryName: key, items: self.categories[key]!)}
            }
                .navigationBarTitle(Text("Featured"))
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
