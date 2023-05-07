//
//  ErrorTypes.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 06/05/2023.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData    = "invalid data"
    case invalidUrl     = "invalid url"
    case generalError   = "an error happened"
}
