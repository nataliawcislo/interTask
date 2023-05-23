//
//  WeatherModel.swift
//  interTask
//
//  Created by Natalia Wcislo on 16.05.23.
//

import Foundation


/// model definition to data
struct WeatherModel: Decodable, Identifiable {
    var id = UUID()
    let latitude, longitude: Double
    let currentWeather: CurrentWeather
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case currentWeather = "current_weather"
        case daily
    }
}

/// model definition to data
struct CurrentWeather: Decodable, Identifiable {
    var id = UUID()
    let temperature: Double
    let time: String

    enum CodingKeys: String, CodingKey {
        case temperature
        case time
    }
}

/// model definition to data
struct Daily: Decodable, Identifiable {
    var id = UUID()
    let time: [String]
    let temperature2MMax, temperature2MMin: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}


//Codable is actually just a typealias for both Encodable and Decodable . Encodable is reponsible for encoding a struct into JSON data and, you probably guessed, Decodable is for decoding JSON data into a struct.
