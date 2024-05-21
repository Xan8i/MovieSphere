//
//  PopularMoviesTabView.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 14/5/24.
//

import SwiftUI

struct MovieTabView: View {
    @StateObject var viewModel: MovieTabViewModel
    
    var body: some View {
        NavigationStack {
            if let movies = viewModel.movies {
                VStack {
                    MoviesListView(movies: movies)
                }
                .ignoresSafeArea()
            } else {
                LoadingView()
                    .task {
                        await viewModel.getMovieList()
                    }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MovieTabView(viewModel: MovieTabViewModel(moviesType: .popular))
}
