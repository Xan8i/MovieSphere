//
//  MovieViewModel.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 27/2/24.
//

import Foundation
import SwiftUI

final class MovieViewModel: ObservableObject {
    var movie: MovieModel
    
    init(movie: MovieModel) {
        self.movie = movie
    }
}
