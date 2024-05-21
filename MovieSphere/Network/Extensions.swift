//
//  Extensions.swift
//  MovieSphere
//
//  Created by Xanthi Panagiotopoulou on 28/2/24.
//

import Foundation

extension DateFormatter {
    static func convertToDate(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: date) ?? Date()
    }
}

extension CGFloat {
    func roundNumber() -> String {
        return String(format: "%.1f", self)
    }
}
