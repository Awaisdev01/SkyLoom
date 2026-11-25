//
//  SkyLoom_SwiftUIApp.swift
//  SkyLoom-SwiftUI
//
//  Created by Hishara Dilshan on 07/10/2024.
//

import SwiftUI
import DependencyInjector

@main
struct SkyLoom_SwiftUIApp: App {
    @Injectable(\.weatherDataStore) var weatherDataStore: WeatherDataStore
    @State var routes: [AppRoute] = .init()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routes) {
                WeatherView()
                    .environmentObject(weatherDataStore)
                    .environment(\.navigation, .init(callback: { route in
                        self.routes.append(route)
                    }))
            }
        }
    }
}
