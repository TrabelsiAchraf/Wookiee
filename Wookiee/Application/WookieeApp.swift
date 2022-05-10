//
//  WookieeApp.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 03/05/2022.
//

import SwiftUI

@main
struct WookieeApp: App {
    
    private var container = DependencyContainer()
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(.background)
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MovieListView(viewModel: container.makeDefaultMoviesViewModel())
                    .tabItem {
                        Image(systemName: "list.and.film")
                    }
                
                MovieListView(viewModel: container.makeDefaultMoviesViewModel())
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
            }
        }
    }
}
