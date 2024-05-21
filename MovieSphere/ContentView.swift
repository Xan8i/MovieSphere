//
//  ContentView.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 21/2/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            MovieTabView(viewModel: MovieTabViewModel(moviesType: .popular))
                .tabItem {
                    Label("Popular", systemImage: "flame")
                }
            
            MovieTabView(viewModel: MovieTabViewModel(moviesType: .nowPlaying))
                .tabItem {
                    Label("Now Playing", systemImage: "popcorn")
                }
            
            MovieTabView(viewModel: MovieTabViewModel(moviesType: .upcoming))
                .tabItem {
                    Label("Upcoming", systemImage: "arrow.up.square")
                }
            
            MovieTabView(viewModel: MovieTabViewModel(moviesType: .topRated))
                .tabItem {
                    Label("Top Rated", systemImage: "hands.sparkles")
                }
        }
    }
}


#Preview {
    ContentView()
}
