//
//  StarsRatingView.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 28/2/24.
//

import SwiftUI

struct StarsRatingView: View {
    var rating: CGFloat
    var maxRating = 5
    
    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .symbolEffect(.pulse)
                    .aspectRatio(contentMode: .fit)
            }
        }
        
        stars
            .overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}

#Preview {
    StarsRatingView(rating: 3.5)
}
