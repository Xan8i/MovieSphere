//
//  MovieModel.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 22/2/24.
//

import Foundation
import SwiftUI


struct ResponseBody: Codable {
    let results: [MovieModel]
}

struct MovieModel: Codable {
    let id: Int
    let genreIds: [Int]
    let originalLanguage: String
    let overview: String
    let backdropPath: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double
    
    var posterURL: String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    var backdropURL: String {
        "https://image.tmdb.org/t/p/w500\(backdropPath)"
    }
    
    var date: Date {
        DateFormatter.convertToDate(releaseDate)
    }
    
    var originalLanguageUppercased: String {
        originalLanguage.uppercased()
    }
    
    var usersRating: CGFloat {
        let percentage = voteAverage * 0.5
        let roundedPercentage = round(percentage * 10) / 10.0
        return roundedPercentage
    }
    
    //func getGenresList()
    
}

struct MovieList: Codable {
    let genres: [MovieGenre]
}

struct MovieGenre: Codable {
    let id: Int
    let name: String
}


