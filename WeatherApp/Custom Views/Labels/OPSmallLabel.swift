//
//  OPSmallLabel.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 04/05/2023.
//

import UIKit

class OPSmallLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
    }
    
    private func configure() {
        textAlignment = .center
        textColor = .black
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
    }

}
