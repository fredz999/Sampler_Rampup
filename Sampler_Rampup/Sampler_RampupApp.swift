//
//  Sampler_RampupApp.swift
//  Sampler_Rampup
//
//  Created by Jonathan Brown on 03/12/2024.
//

import SwiftUI
import SwiftData

@main
struct Sampler_RampupApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: DataItem.self)
    }
}
