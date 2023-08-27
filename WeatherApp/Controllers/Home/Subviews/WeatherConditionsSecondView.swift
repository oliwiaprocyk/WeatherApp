//
//  WeatherConditionsSecondView.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 07/05/2023.
//

import UIKit

final class WeatherConditionsSecondView: UIView {
    let humidityImageView = OPImageView(systemName: SFSymbols.humiditySymbol, tintColor: .white, weight: .medium)
    let humidityLabel = OPSmallLabel(fontSize: 20)
    let humidityLevelLabel = OPSmallLabel(fontSize: 20)
    let pressureImageView = OPImageView(systemName: SFSymbols.pressureSymbol, tintColor: .white, weight: .medium)
    let pressureLabel = OPSmallLabel(fontSize: 20)
    let pressureLevelLabel = OPSmallLabel(fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addSubviews()
        configureHumidityItems()
        configurePressureItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .lightGray
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
        alpha = 0.6
    }
    
    private func addSubviews() {
        addSubview(humidityImageView)
        addSubview(humidityLabel)
        addSubview(humidityLevelLabel)
        addSubview(pressureImageView)
        addSubview(pressureLabel)
        addSubview(pressureLevelLabel)
    }
    
    private func configureHumidityItems() {
        humidityLabel.text = Labels.humidity
        
        humidityImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(50)
        }
        
        humidityLabel.snp.makeConstraints { make in
            make.leading.equalTo(humidityImageView.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(80)
            make.height.equalTo(25)
        }
        
        humidityLevelLabel.snp.makeConstraints { make in
            make.leading.equalTo(humidityImageView.snp.trailing)
            make.top.equalTo(humidityLabel.snp.bottom)
            make.width.equalTo(80)
            make.height.equalTo(25)
        }
    }
    
    private func configurePressureItems() {
        pressureLabel.text = Labels.pressure
        
        pressureImageView.snp.makeConstraints { make in
            make.leading.equalTo(humidityLabel.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(50)
        }
        
        pressureLabel.snp.makeConstraints { make in
            make.leading.equalTo(pressureImageView.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(80)
            make.height.equalTo(25)
        }
        
        pressureLevelLabel.snp.makeConstraints { make in
            make.leading.equalTo(pressureImageView.snp.trailing)
            make.top.equalTo(pressureLabel.snp.bottom)
            make.width.equalTo(80)
            make.height.equalTo(25)
        }
    }
}
