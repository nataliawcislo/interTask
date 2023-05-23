//
//  CurrentWeather.swift
//  interTask
//
//  Created by Natalia Wcislo on 17.05.23.
//

import Foundation


struct CurrentWeatherModel: Codable, Identifiable {
    let latitude, longitude, generationtimeMS: Double
    let currentWeather: CurrentWeather

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case currentWeather = "current_weather"
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable, Identifiable {
    var id = UUID()
    let temperatura: Double
    let time: String

    enum CodingKeys: String, CodingKey {
        case temperatura
        case time
    }
}

//////https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true
////current
