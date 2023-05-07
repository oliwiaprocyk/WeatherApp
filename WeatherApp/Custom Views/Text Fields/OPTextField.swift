//
//  OPTextField.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 06/05/2023.
//

import UIKit

class OPTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        placeholder = "Type city name"
        tintColor = .white
        textColor = .white
        alpha = 0.5
        layer.cornerRadius = 8
        textAlignment = .right
        backgroundColor = .lightGray
        font = UIFont.systemFont(ofSize: 20, weight: .regular)
    }
}
