//
//  WeatherConditionsView.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 07/05/2023.
//

import UIKit

final class WeatherConditionsView: UIView {
    let feelsLikeImageView = OPImageView(systemName: SFSymbols.feelsLikeSymbol, tintColor: .white, weight: .light)
    let feelsLikeLabel = OPSmallLabel(fontSize: 16)
    let feelsLikeDegreeLabel = OPSmallLabel(fontSize: 16)
    let minTempImageView = OPImageView(systemName: SFSymbols.minTempSymbol, tintColor: .white, weight: .light)
    let minTempLabel = OPSmallLabel(fontSize: 16)
    let minTempDegreeLabel = OPSmallLabel(fontSize: 16)
    let maxTempImageView = OPImageView(systemName: SFSymbols.maxTempSymbol, tintColor: .white, weight: .light)
    let maxTempLabel = OPSmallLabel(fontSize: 16)
    let maxTempDegreeLabel = OPSmallLabel(fontSize: 16)
    let windyImageView = OPImageView(systemName: SFSymbols.windySymbol, tintColor: .white, weight: .light)
    let windyLabel = OPSmallLabel(fontSize: 16)
    let windySpeedLabel = OPSmallLabel(fontSize: 16)
    let cloudImageView = OPImageView(systemName: SFSymbols.cloudSymbol, tintColor: .white, weight: .light)
    let cloudLabel = OPSmallLabel(fontSize: 16)
    let cloudLevelLabel = OPSmallLabel(fontSize: 16)
    let visibleImageView = OPImageView(systemName: SFSymbols.visibilitySymbol, tintColor: .white, weight: .light)
    let visibleLabel = OPSmallLabel(fontSize: 16)
    let visibilityLabel = OPSmallLabel(fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addSubviews()
        configureFeelsLikeItems()
        configureMinTempItems()
        configureMaxTempItems()
        configureWindyItems()
        configureCloudItems()
        configureVisibleItems()
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
        addSubview(feelsLikeImageView)
        addSubview(feelsLikeLabel)
        addSubview(feelsLikeDegreeLabel)
        addSubview(minTempImageView)
        addSubview(minTempLabel)
        addSubview(minTempDegreeLabel)
        addSubview(maxTempImageView)
        addSubview(maxTempLabel)
        addSubview(maxTempDegreeLabel)
        addSubview(windyImageView)
        addSubview(windyLabel)
        addSubview(windySpeedLabel)
        addSubview(cloudImageView)
        addSubview(cloudLabel)
        addSubview(cloudLevelLabel)
        addSubview(visibleImageView)
        addSubview(visibleLabel)
        addSubview(visibilityLabel)
    }
    
    private func configureFeelsLikeItems() {
        feelsLikeLabel.text = Labels.feelsLike
        
        feelsLikeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        feelsLikeLabel.snp.makeConstraints { make in
            make.leading.equalTo(feelsLikeImageView.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        feelsLikeDegreeLabel.snp.makeConstraints { make in
            make.leading.equalTo(feelsLikeImageView.snp.trailing)
            make.top.equalTo(feelsLikeLabel.snp.bottom)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
    
    private func configureMinTempItems() {
        minTempLabel.text = Labels.minTemp
        
        minTempImageView.snp.makeConstraints { make in
            make.leading.equalTo(feelsLikeLabel.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        minTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(minTempImageView.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        minTempDegreeLabel.snp.makeConstraints { make in
            make.leading.equalTo(minTempImageView.snp.trailing)
            make.top.equalTo(minTempLabel.snp.bottom)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
    
    private func configureMaxTempItems() {
        maxTempLabel.text = Labels.maxTemp
        
        maxTempImageView.snp.makeConstraints { make in
            make.leading.equalTo(minTempLabel.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        maxTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(maxTempImageView.snp.trailing)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        maxTempDegreeLabel.snp.makeConstraints { make in
            make.leading.equalTo(maxTempImageView.snp.trailing)
            make.top.equalTo(minTempLabel.snp.bottom)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
    
    private func configureWindyItems() {
        windyLabel.text = Labels.wind
        
        windyImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(feelsLikeImageView.snp.bottom).offset(25)
            make.width.height.equalTo(40)
        }
        
        windyLabel.snp.makeConstraints { make in
            make.leading.equalTo(windyImageView.snp.trailing)
            make.top.equalTo(feelsLikeDegreeLabel.snp.bottom).offset(25)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        windySpeedLabel.snp.makeConstraints { make in
            make.leading.equalTo(windyImageView.snp.trailing)
            make.top.equalTo(windyLabel.snp.bottom)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
    
    private func configureCloudItems() {
        cloudLabel.text = Labels.cloud
        
        cloudImageView.snp.makeConstraints { make in
            make.leading.equalTo(windyLabel.snp.trailing)
            make.top.equalTo(minTempImageView.snp.bottom).offset(25)
            make.width.height.equalTo(40)
        }
        
        cloudLabel.snp.makeConstraints { make in
            make.leading.equalTo(cloudImageView.snp.trailing)
            make.top.equalTo(minTempImageView.snp.bottom).offset(25)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        cloudLevelLabel.snp.makeConstraints { make in
            make.leading.equalTo(cloudImageView.snp.trailing)
            make.top.equalTo(cloudLabel.snp.bottom)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
    
    private func configureVisibleItems() {
        visibleLabel.text = Labels.visibility
        
        visibleImageView.snp.makeConstraints { make in
            make.leading.equalTo(cloudLabel.snp.trailing)
            make.top.equalTo(maxTempImageView.snp.bottom).offset(25)
            make.width.height.equalTo(40)
        }
        
        visibleLabel.snp.makeConstraints { make in
            make.leading.equalTo(visibleImageView.snp.trailing)
            make.top.equalTo(maxTempImageView.snp.bottom).offset(25)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        visibilityLabel.snp.makeConstraints { make in
            make.leading.equalTo(visibleImageView.snp.trailing)
            make.top.equalTo(visibleLabel.snp.bottom)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
}
