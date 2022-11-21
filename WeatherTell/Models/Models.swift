//
//  Models.swift
//  WeatherTell
//
//  Created by Giorgi Samkharadze on 16.11.22.
//

import Foundation
import SwiftUI
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var headerViewModel = HeaderViewModel()
    @Published  var hourlyData : [HourData] = []
    @Published var dailyData : [DayData] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        LocationManager.shared.getLocation { location in
            LocationManager.shared
                .resolveName(for: CLLocation(latitude: location.lat, longitude: location.lon)) { name in
                    DispatchQueue.main.async {
                        self.headerViewModel.location = name ?? "Current"

                    }
                }
            
            let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(location.lat)&lon=\(location.lon)&exclude=minutely&units=metric&appid=f14cf1d56cea710913063663e6c937e7"
            guard let url = URL(string: urlString) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                   let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.headerViewModel.currentTemp = "\(Int(result.current.temp))°C"
                        self.headerViewModel.currentConditions = result.current.weather.first?.main ?? "-"
                        self.headerViewModel.iconURLString = String.iconUrlString(for: result.current.weather.first?.icon ?? "-")
                        //Hourly
                        self.hourlyData = result.hourly.compactMap({
                            
                            let data = HourData()
                            data.temp = "\(Int($0.temp))°C"
                            data.hour = String.hour(from: $0.dt)
                            data.imageURL = String.iconUrlString(for: $0.weather.first?.icon ?? "-")
                            return data
                        })
                        
                        // Daily
                        self.dailyData = result.daily.compactMap({
                            let data = DayData()
                            data.day = String.day(from: $0.dt)
                            data.high = "H: \(Int($0.temp.max)) °C"
                            data.low = "L: \(Int($0.temp.min)) °C"
                            return data
                        })
                    }
                    return
                }
                catch {
                    print(error)
                }
                
            }
            task.resume()

        }
                
        
    }
    
}

// MARK: - Header

class HeaderViewModel: ObservableObject {
    var location: String = "New York City, NY"
    var currentTemp : String = "75°"
    var currentConditions: String = "Cloudy Sun"
    var iconURLString = "https://www.apple.com"
    
}
// MARK: - Hourly

class HourData : ObservableObject, Identifiable {
    var id = UUID()
    var temp = "55"
    var hour = "1PM"
    var imageURL = "https://www.apple.com"
}
// MARK: - Daily

class DayData : ObservableObject, Identifiable {
    var id = UUID()
    var day = "Monday"
    var high = "H: 77 F"
    var low = "L: 47 F"
}
