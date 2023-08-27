//
//  LocationService.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 06/05/2023.
//

import Foundation
import CoreLocation

final class LocationService {
    static let shared = LocationService()
    private init(){}
    
    func getLocation(latitude: CLLocationDegrees, longitute: CLLocationDegrees, completion: @escaping((WeatherModel?, String?)->())) {
        
        let urlString = "\(APIConstants.baseURL)?appid=\(APIConstants.apiKEY)\(APIConstants.unitMetric)&lat=\(latitude)&lon=\(longitute)"
        
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
