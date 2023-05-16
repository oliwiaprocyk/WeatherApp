//
//  FortuneVC.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 08/05/2023.
//

import UIKit
import SnapKit

class FortuneVC: UIViewController {
    let backgroundImageView = UIImageView()
    let fortuneLabel = OPMiddleLabel(fontSize: 20)
    let backgroundView = OPImageView(systemName: SFSymbols.background, tintColor: .lightGray, weight: .thin)
    let aFortuneLabel = OPSmallLabel(fontSize: 25)
    let fortuneButton = OPButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureVC()
        configureFortuneLabel()
        configureAFortuneLabel()
        configureFortuneButton()
        configureButton()
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(fortuneLabel)
        view.addSubview(backgroundView)
        view.addSubview(fortuneButton)
        backgroundView.addSubview(aFortuneLabel)
    }
    
    private func configureVC() {
        backgroundImageView.image = Images.backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureFortuneLabel() {
        fortuneLabel.text = Labels.fortune
        
        fortuneLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(200)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
    }
    
    private func configureAFortuneLabel() {
        backgroundView.alpha = 0.3
        backgroundView.layer.shadowColor = UIColor.systemOrange.cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowOffset = CGSize.zero
        
        aFortuneLabel.text = Labels.aFortune
        aFortuneLabel.numberOfLines = 4
        
        backgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(fortuneLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(260)
        }
        
        aFortuneLabel.snp.makeConstraints { make in
            make.leading.equalTo(backgroundView.snp.leading).offset(40)
            make.top.equalTo(backgroundView.snp.top).offset(120)
            make.trailing.equalTo(backgroundView.snp.trailing).offset(-40)
            make.height.equalTo(100)
        }
    }
    
    private func configureFortuneButton() {
        fortuneButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(100)
            make.top.equalTo(backgroundView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(40)
        }
    }
    
    private func configureButton() {
        fortuneButton.addTarget(self, action: #selector(fortuneButtonTapped), for: .touchUpInside)
    }
    
    @objc private func fortuneButtonTapped() {
        self.aFortuneLabel.text = FortuneModel().fortunes[Int.random(in: 0...67)]
    }
}
