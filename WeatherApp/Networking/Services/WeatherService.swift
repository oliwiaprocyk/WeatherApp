//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 06/05/2023.
//

import Foundation

class WeatherService {
    static let shared = WeatherService()
    private init(){}
    
    func getWeather(cityName: String, completion: @escaping((WeatherModel?, String?)->())) {
        
        let urlString = "\(APIConstants.baseURL)?appid=\(APIConstants.apiKey)\(APIConstants.unitMetric)&q=\(cityName)"
        
        NetworkManager.shared.request(type: WeatherModel.self,
                                      url: urlString,
                                      method: HTTPMethods.get) { response in
            switch response {
            case .success(let items):
                completion(items, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
}
