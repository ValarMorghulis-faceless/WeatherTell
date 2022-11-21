//
//  Extensions.swift
//  WeatherTell
//
//  Created by Giorgi Samkharadze on 21.11.22.
//
import SwiftUI
import Foundation

extension DateFormatter {
    static let hourFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "ha"
        return formatter
    }()
    static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "EEEE"
        return formatter
    }()
}

extension String {
    static func hour(from dt: Float) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        return DateFormatter.hourFormatter.string(from: date)
    }
    static func day(from dt: Float) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        return DateFormatter.dayFormatter.string(from: date)
    }
}
extension String {
    static func iconUrlString(for iconCode: String) -> String {
        return "https://openweathermap.org/img/wn/\(iconCode)@4x.png"
        
    }
}

