//
//  DetailsCollectionViewCell.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 11/05/2023.
//

import UIKit
import SnapKit

final class DetailsCollectionViewCell: UICollectionViewCell {
    let hourLabel = OPMiddleLabel(fontSize: 20)
    let degreeLabel = OPBigLabel(fontSize: 50)
    let textLabel = OPMiddleLabel(fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureLabels()
        contentView.backgroundColor = .quaternaryLabel
        contentView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(hourLabel)
        contentView.addSubview(degreeLabel)
        contentView.addSubview(textLabel)
    }
    
    private func configureLabels() {
        hourLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(20)
        }
        
        degreeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(hourLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(60)
        }
        
        textLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(20)
        }
    }
}
