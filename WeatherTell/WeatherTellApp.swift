//
//  WeatherTellApp.swift
//  WeatherTell
//
//  Created by Giorgi Samkharadze on 16.11.22.
//

import SwiftUI

@main
struct WeatherTellApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = WeatherViewModel()
            ContentView().environmentObject(viewModel)
        }
    }
}
