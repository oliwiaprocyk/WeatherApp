//
//  DetailsVM.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 12/05/2023.
//

import Foundation

protocol DetailsVMDelegate: AnyObject {
    func success()
    func error(error: String)
}

final class DetailsVM {
    var details: [Hour] = []
    weak var delegate: DetailsVMDelegate?
    var cityName: String?
    
    func getDetails(cityName: String) {
        DetailsService.shared.getDetails(cityName: cityName) { [weak self] response, errorMessage in
            guard let self = self else { return }
            
            if let results = response?.forecast.forecastday {
                for i in results {
                    details.append(contentsOf: i.hour)
                }
                self.delegate?.success()
            } else {
                self.delegate?.error(error: errorMessage ?? "Something went wrong.")
            }
        }
    }
}
