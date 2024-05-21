//
//  ContentViewModel.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 22/2/24.
//

import Foundation

@MainActor
final class MovieTabViewModel: ObservableObject {
    var movieService = MovieService()
    @Published var movies: ResponseBody?
    
    var moviesType: MoviesType
    
    init(moviesType: MoviesType) {
        self.moviesType = moviesType
    }
    
    func getMovieList() async {
        do {
            print("Initializing request")
            movies = try await movieService.getMovies(for: moviesType)
            print("Success! 😃 \(movies?.results.count ?? 0) movies fetched")

        } catch {
            print("Oops! 😱 Error getting movies: \(error)")
        }
    }
}
