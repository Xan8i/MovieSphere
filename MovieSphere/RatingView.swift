//
//  RatingView.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 28/2/24.
//

import SwiftUI

struct RatingView: View {
    var rating: CGFloat
    
    var body: some View {
        HStack(spacing: 20) {
            StarsRatingView(rating: rating)
                .frame(width: 100)
            Text(rating.roundNumber())
                .font(.title3.bold())
        }
    }
}

#Preview {
    RatingView(rating: 3.5)
}
