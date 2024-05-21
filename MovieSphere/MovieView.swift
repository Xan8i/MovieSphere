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
            ZStack {
                AsyncImage(url: URL(string: viewModel.movie.posterURL)) { image in
                    image
                        .resizable()
                        .blur(radius: 80)
                        .opacity(0.6)
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.height)
                        
                }
                
                VStack{
                    
                    Text(viewModel.movie.title)
                        .multilineTextAlignment(.center)
                        .font(.title2.bold())
                    
                    
                    Text("(\(viewModel.movie.date.formatted(.dateTime.year())))")
                        .font(.title3)
                        .opacity(0.7)
                    
                    
                    NavigationLink {
                        MovieDetailView(movie: viewModel.movie)
                    } label: {
                        AsyncImage(url: URL(string: viewModel.movie.posterURL)) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(height: geo.size.height/1.7)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        } placeholder: {
                            ProgressView()
                                .frame(height: geo.size.height/1.7)
                        }
                    }
                    
                    
                    Text(viewModel.movie.movieGenres)
                    
                    RatingView(rating: viewModel.movie.usersRating)
                        .padding()
                }
                .padding()
            .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    MovieView(viewModel: MovieViewModel(movie: previewMovies.results[16]))
}
