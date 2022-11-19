//
//  Models.swift
//  WeatherTell
//
//  Created by Giorgi Samkharadze on 16.11.22.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var headerViewModel = HeaderViewModel()
    @Published  var hourlyData : [HourData] = []
    @Published var dailyData : [DayData] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=minutely&unit=imperial&appid=f14cf1d56cea710913063663e6c937e7"
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
        }
        task.resume()
        
        
    }
    
}

// MARK: - Header

class HeaderViewModel: ObservableObject {
    var location: String = "New York City, NY"
    var currentTemp : String = "75°"
    var currentConditions: String = "Cloudy Sun"
    
}
// MARK: - Hourly

class HourData : ObservableObject {
    var temp = "55"
    var hour = "1PM"
    var imageURL = "sun.max.fill"
}
// MARK: - Daily

class DayData : ObservableObject {
    var day = "Monday"
    var high = "H: 77 F"
    var low = "L: 47 F"
}
