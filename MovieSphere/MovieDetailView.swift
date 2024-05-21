//
//  MovieDetailView.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 17/5/24.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: MovieModel
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .top) {
                    AsyncImage(url: URL(string: movie.backdropURL)) { image in
                        image
                            .resizable()
                            .opacity(0.3)
                            .shadow(color: .black, radius: 7)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: geo.size.height/10)
                        
                        HStack(alignment: .center) {
                            AsyncImage(url: URL(string: movie.posterURL)) { image in
                                image
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFit()
                            .frame(width: 150)
                            .padding()
                            
                            
                            VStack(alignment: .leading) {
                                VStack {
                                    Text(movie.title)
                                        .multilineTextAlignment(.leading)
                                        .font(.title.bold())
                                    Text("(\(movie.date.formatted(.dateTime.year())))")
                                        .font(.title2)
                                        .opacity(0.7)
                                }
                                
                                HStack {
                                    Text(movie.date.formatted(date: .numeric, time: .omitted))
                                    Text("(\(movie.originalLanguageUppercased))")
                                }
                                .font(.subheadline)
                                
                                RatingView(rating: movie.usersRating)
         
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overview")
                                .font(.title3)
                            
                            Text(movie.overview)
                                .multilineTextAlignment(.leading)
                                .font(.callout)
                                .truncationMode(.tail)
                        }
                        .padding()   
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    MovieDetailView(movie: previewMovies.results[1])
}
