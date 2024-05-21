//
//  MovieView.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 22/2/24.
//

import SwiftUI

struct MovieView: View {
  @ObservedObject var viewModel: MovieViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 10) {
                
                Text(viewModel.movie.title)
                    .multilineTextAlignment(.center)
                    .font(.title2.bold())
                
                Text("(\(viewModel.movie.date.formatted(.dateTime.year())))")
                    .font(.title2)
                    .opacity(0.7)
                
                
                NavigationLink {
                    MovieDetailView(movie: viewModel.movie)
                } label: {
                    AsyncImage(url: URL(string: viewModel.movie.posterURL)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: geo.size.height/1.8)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                
                HStack {
                    Text(viewModel.movie.date.formatted(date: .abbreviated, time: .omitted))
                    Text("(\(viewModel.movie.originalLanguageUppercased))")
                }
                .font(.subheadline)
                
                
                RatingView(rating: viewModel.movie.usersRating)
                
                VStack(alignment: .leading) {
                    Text("Overview")
                        .font(.title3)
                    
                    Text(viewModel.movie.overview)
                        .multilineTextAlignment(.leading)
                        .font(.callout)
                        .truncationMode(.tail)
                }
                .padding()
            }
            .padding()
        .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    MovieView(viewModel: MovieViewModel(movie: previewMovies.results[14]))
}
