//
//  LandmarkList.swift
//  Landmarks
//
//  Created by SHIBU DANIEL on 10/5/20.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavoritesOnly = false
    
    var body: some View {
           NavigationView {
               List {
                    Toggle(isOn: $showFavoritesOnly) {
                                    Text("Favorites only")
                                }
                   ForEach(landmarkData) { landmark in
                       if !self.showFavoritesOnly || landmark.isFavorite {
                           NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                               LandmarkRow(landmark: landmark)
                           }
                       }
                   }
               }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
            ForEach(["iPhone 11 Pro"], id: \.self) { deviceName in
                LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
    }
}
