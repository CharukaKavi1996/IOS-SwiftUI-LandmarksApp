//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Charuka on 2025-03-24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
