//
//  DetailsService.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 12/05/2023.
//

import Foundation

class DetailsService {
    static let shared = DetailsService()
    private init(){}
    
    func getDetails(cityName: String, completion: @escaping((DetailsModel?, String?)->())) {
        
        let urlString = "\(APIConstants.baseUrl)?key=\(APIConstants.apiKey)&q=\(cityName)\(APIConstants.apiEndPoint)"
        
        NetworkManager.shared.request(type: DetailsModel.self,
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
