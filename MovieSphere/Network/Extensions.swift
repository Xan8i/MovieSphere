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

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        ///locating file in bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        ///loading file from bundle
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        ///decoding file from bundle
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
