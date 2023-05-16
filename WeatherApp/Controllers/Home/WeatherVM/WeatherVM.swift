//
//  WeatherVM.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 06/05/2023.
//

import Foundation
import CoreLocation

protocol WeatherVMDelegate: AnyObject {
    func success()
    func error(error: String)
}

final class WeatherVM {
    var weather: WeatherModel?
    weak var delegate: WeatherVMDelegate?
    
    func getWeather(cityName: String) {
        WeatherService.shared.getWeather(cityName: cityName) { [weak self] response, errorMessage in
            guard let self = self else { return }
            
            if let results = response {
                self.weather = results
                self.delegate?.success()
            } else {
                self.delegate?.error(error: errorMessage ?? "Something went wrong.")
            }
        }
    }
    
    func getLocation(latitude: CLLocationDegrees, longitute: CLLocationDegrees) {
        LocationService.shared.getLocation(latitude: latitude, longitute: longitute) { [weak self] response, errorMessage in
            guard let self = self else { return }
            
            if let results = response {
                self.weather = results
                self.delegate?.success()
            } else {
                self.delegate?.error(error: errorMessage ?? "Something went wrong.")
            }
        }
    }
}
