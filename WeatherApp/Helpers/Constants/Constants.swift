//
//  Constants.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 07/05/2023.
//

import UIKit

enum SFSymbols {
    static let locationButtonSymbol = "location.circle.fill"
    static let searchButtonSymbol = "magnifyingglass"
    static let windSymbol = "wind.circle"
    static let rainSymbol = "cloud.rain.circle"
    static let feelsLikeSymbol = "cloud.sun"
    static let minTempSymbol = "cloud"
    static let maxTempSymbol = "sun.max"
    static let windySymbol = "wind"
    static let cloudSymbol = "cloud.fill"
    static let visibilitySymbol = "eye"
    static let humiditySymbol = "humidity"
    static let pressureSymbol = "thermometer.high"
    static let destinationSymbol = "face.smiling"
    static let background = "cloud.fill"
}

enum Images {
    static let backgroundImage = UIImage(named: "background")
}

enum Labels {
    static let feelsLike = "Feels like"
    static let minTemp = "Min Temp"
    static let maxTemp = "Max Temp"
    static let wind = "Wind"
    static let cloud = "Cloudness"
    static let visibility = "Visibility"
    static let humidity = "Humidity"
    static let pressure = "Pressure"
    static let destionation = "To draw a sentence for today, tap me"
    static let fortune = "🧚🏻‍♂️ Click the button to see a fortune 🧚🏻‍♂️"
    static let aFortune = "Are you ready?"
}

enum ReuseIDs {
    static let tableViewCell = "DetailsTableViewCell"
    static let collectionViewCell = "DetailsCollectionViewCell"
}
