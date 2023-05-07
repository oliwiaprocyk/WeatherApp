//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 06/05/2023.
//

import Foundation

struct WeatherModel: Codable {
    let name: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let weather: [Weather]?
}

struct Main: Codable {
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    let pressure: Int?
    let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Weather: Codable {
    let id: Int?
}

struct Wind: Codable {
    let speed: Double?
}

struct Clouds: Codable {
    let all: Int?
}
