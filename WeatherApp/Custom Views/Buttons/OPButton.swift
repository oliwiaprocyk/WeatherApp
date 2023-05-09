//
//  OPButton.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 09/05/2023.
//

import UIKit

class OPButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Let's draw! ✨", for: .normal)
        backgroundColor = .lightGray
        alpha = 0.6
        layer.cornerRadius = 10
    }
}
