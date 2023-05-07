//
//  OPImageView.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 04/05/2023.
//

import UIKit

class OPImageView: UIImageView {    
    convenience init(systemName: String, tintColor: UIColor, weight: UIImage.SymbolWeight) {
        self.init(frame: .zero)
        let configuration = UIImage.SymbolConfiguration(weight: weight)
        image = UIImage(systemName: systemName, withConfiguration: configuration)
        self.tintColor = tintColor
    }
}
