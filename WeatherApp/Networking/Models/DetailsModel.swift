//
//  DetailsModel.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 12/05/2023.
//

import Foundation

struct DetailsModel: Codable {
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable {
    let hour: [Hour]
}

struct Hour: Codable {
    let time: String?
    let tempC: Double?
    let condition: Condition?
    
    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
    }
}

struct Condition: Codable {
    let text: String?
}
