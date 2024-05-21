//
//  MovieService.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 21/2/24.
//

import Foundation

//api used: https://www.themoviedb.org/

// key "accept"
// value "application/json"

// key "Authorization"
// value "Bearer ACCESS_TOKEN"

// API Key: 707bb46d2e1fba3596684c7617bbb936

//API Read Access Token:
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDdiYjQ2ZDJlMWZiYTM1OTY2ODRjNzYxN2JiYjkzNiIsInN1YiI6IjY1ZDVmYmJlMGU0ZmM4MDE4Njg1MThkZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SM5U6m3Xp2Y6vQtLfjmHV_kqv9d9Xw5bGsInFcCW-OY

enum MoviesType: String {
    case popular = "popular"
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    case upcoming = "upcoming"
}

class MovieService {
    let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDdiYjQ2ZDJlMWZiYTM1OTY2ODRjNzYxN2JiYjkzNiIsInN1YiI6IjY1ZDVmYmJlMGU0ZmM4MDE4Njg1MThkZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SM5U6m3Xp2Y6vQtLfjmHV_kqv9d9Xw5bGsInFcCW-OY"
    
    
    func getMovies(for type: MoviesType) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(type.rawValue)") else {
            fatalError("Missing URL")
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching movie data")}
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedResponse = try decoder.decode(ResponseBody.self, from: data)
        return decodedResponse
    }
    
    func getGenresList() async throws -> Genres {
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list") else {
            fatalError("Missing URL")
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching movie list")}
        
        let decoder = JSONDecoder()
        
        let decodedResponse = try decoder.decode(Genres.self, from: data)
        return decodedResponse
    }
}
