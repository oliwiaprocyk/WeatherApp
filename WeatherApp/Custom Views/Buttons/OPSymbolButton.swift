//
//  OPButton.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 06/05/2023.
//

import UIKit

class OPSymbolButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(imageName: String) {
        self.init(frame: .zero)
        let configuration = UIImage.SymbolConfiguration(pointSize: 30)
        setPreferredSymbolConfiguration(configuration, forImageIn: .normal)
        setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    private func configure() {
        tintColor = .secondaryLabel
    }
}
