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
                            .scaledToFit()
                            .opacity(0.7)
                            .overlay {
                                LinearGradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.7),
                                    Gradient.Stop(color: .black, location: 1)
                                ], startPoint: .top, endPoint: .bottom)
                            }
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: geo.size.height/5)
                        
                        HStack(alignment: .center) {
                            AsyncImage(url: URL(string: movie.posterURL)) { image in
                                image
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFit()
                            .frame(width: geo.size.width/2)
                            .shadow(color: .black, radius: 20)
                            .padding(10)
                            
                            
                            Text(movie.title)
                                .multilineTextAlignment(.leading)
                                .font(.title2.bold())
                        }
                        .padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(movie.date.formatted(date: .numeric, time: .omitted))
                                Text("(\(movie.originalLanguageUppercased))")
                            }
                            .font(.title3)
                            
                            RatingView(rating: movie.usersRating)
                                .padding([.top, .bottom])
                            
                            Text("Overview")
                                .font(.title3)
                            
                            Text(movie.overview)
                                .font(.callout)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()   
                    }
                }
            }
            .background(AsyncImage(url: URL(string: movie.posterURL)) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .blur(radius: 80)
                    .opacity(0.6)
                
            } placeholder: {
                ProgressView()
            })
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    MovieDetailView(movie: previewMovies.results[3])
}
