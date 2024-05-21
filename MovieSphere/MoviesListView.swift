//
//  AllMoviesView.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 22/2/24.
//

import SwiftUI

struct MoviesListView: View {
    var movies: ResponseBody
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(movies.results, id: \.id) { movie in
                    MovieView(viewModel: MovieViewModel(movie: movie))
                        .frame(width: 400)
                        .padding(.horizontal)
                        .containerRelativeFrame(.horizontal)
                        .scrollTransition(.animated, axis: .horizontal) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.8)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                        }
                }
            }
        }
        .preferredColorScheme(.dark)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    MoviesListView(movies: previewMovies)
}
