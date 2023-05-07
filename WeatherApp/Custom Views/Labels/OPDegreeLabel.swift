//
//  OPDegreeLabel.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 04/05/2023.
//

import UIKit

class OPDegreeLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        textColor = .tertiaryLabel
        font = UIFont.systemFont(ofSize: 80, weight: .thin)
        textAlignment = .center
        
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.60
    }
}
