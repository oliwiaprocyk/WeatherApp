//
//  ViewController.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 04/05/2023.
//

import UIKit
import SnapKit
import CoreLocation

class WeatherVC: UIViewController {
    let locationManager = CLLocationManager()
    let locationButton = OPSymbolButton(imageName: SFSymbols.locationButtonSymbol)
    let locationTextField = OPTextField(frame: .zero)
    let searchButton = OPSymbolButton(imageName: SFSymbols.searchButtonSymbol)
    
    let backgroundImageView = UIImageView()
    let windImageView = OPImageView(systemName: SFSymbols.windSymbol, tintColor: .secondaryLabel, weight: .ultraLight)
    let windLabel = OPBigLabel(fontSize: 30)
    let rainImageView = OPImageView(systemName: SFSymbols.rainSymbol, tintColor: .secondaryLabel, weight: .ultraLight)
    let rainLabel = OPBigLabel(fontSize: 30)
    let degreeLabel = OPDegreeLabel(frame: .zero)
    let locationLabel = OPBigLabel(fontSize: 30)
    
    let weatherConditionsView = WeatherConditionsView(frame: .zero)
    let weatherConditionsSecondView = WeatherConditionsSecondView(frame: .zero)
    
    let destinationVCLabel = OPMiddleLabel(fontSize: 20)
    let destinationVCButton = OPSymbolButton(imageName: SFSymbols.destinationSymbol)
    
    let viewModel = WeatherVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureBackgroundImageView()
        configureButtonsAction()
        
        configureLocationItems()
        configureWindAndRainBar()
        configureDegreeAndLocationLabels()
        configureViews()
        configureDetailsItems()
        
        locationTextField.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        viewModel.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(locationButton)
        view.addSubview(locationTextField)
        view.addSubview(searchButton)
        view.addSubview(windImageView)
        view.addSubview(windLabel)
        view.addSubview(rainImageView)
        view.addSubview(rainLabel)
        view.addSubview(degreeLabel)
        view.addSubview(locationLabel)
        view.addSubview(weatherConditionsView)
        view.addSubview(weatherConditionsSecondView)
        view.addSubview(destinationVCLabel)
        view.addSubview(destinationVCButton)
    }
    
    private func configureBackgroundImageView() {
        backgroundImageView.image = Images.backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureLocationItems() {
        locationButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(5)
            make.top.equalToSuperview().offset(80)
            make.height.width.equalTo(40)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.leading.equalTo(locationButton.snp.trailing).offset(5)
            make.top.equalTo(view.snp.top).offset(80)
            make.trailing.equalTo(searchButton.snp.leading).offset(-5)
            make.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80)
            make.trailing.equalTo(view.snp.trailing).offset(-5)
            make.height.width.equalTo(40)
        }
    }
    
    private func configureWindAndRainBar() {
        windImageView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(50)
            make.top.equalTo(locationButton.snp.bottom).offset(70)
            make.height.width.equalTo(70)
        }
        
        windLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(35)
            make.top.equalTo(self.windImageView.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        rainImageView.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.top.equalTo(searchButton.snp.bottom).offset(70)
            make.height.width.equalTo(70)
        }
        
        rainLabel.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-30)
            make.top.equalTo(rainImageView.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
    }
    
    private func configureDegreeAndLocationLabels() {
        degreeLabel.snp.makeConstraints { make in
            make.leading.equalTo(windImageView.snp.trailing).offset(10)
            make.trailing.equalTo(rainImageView.snp.leading)
            make.top.equalTo(locationTextField.snp.bottom).offset(130)
            make.height.equalTo(70)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(degreeLabel.snp.bottom)
            make.height.equalTo(30)
        }
    }
    
    private func configureViews() {
        weatherConditionsView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(locationLabel.snp.bottom).offset(30)
            make.height.equalTo(130)
        }
        
        weatherConditionsSecondView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(40)
            make.trailing.equalTo(view.snp.trailing).offset(-40)
            make.top.equalTo(weatherConditionsView.snp.bottom).offset(20)
            make.height.equalTo(80)
        }
    }
    
    private func configureDetailsItems() {
        destinationVCLabel.text = Labels.destionation
        
        destinationVCLabel.snp.makeConstraints { make in
            make.trailing.equalTo(destinationVCButton.snp.leading)
            make.bottom.equalToSuperview().offset(-25)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }
        
        destinationVCButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-15)
            make.height.width.equalTo(50)
        }
    }
    
    private func configureButtonsAction() {
        locationButton.addTarget(self, action: #selector(locationButtonPressed), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        destinationVCButton.addTarget(self, action: #selector(destinationVCButtonPressed), for: .touchUpInside)
    }
    
    @objc private func destinationVCButtonPressed() {
        let vc = FortuneVC()
        navigationController?.navigationBar.tintColor = .secondaryLabel
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WeatherVC: UITextFieldDelegate {
    @objc private func searchPressed() {
        locationTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        locationTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something "
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = locationTextField.text {
            viewModel.getWeather(cityName: city)
        }
        locationTextField.text = ""
    }
}

extension WeatherVC: CLLocationManagerDelegate {
    @objc private func locationButtonPressed() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            viewModel.getLocation(latitude: lat, longitute: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "Alert", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension WeatherVC: WeatherVMDelegate {
    func success() {
        DispatchQueue.main.async {
            self.windLabel.text = String(format:"%.1fm/s", self.viewModel.weather?.wind?.speed ?? 0)
            self.rainLabel.text = "\(self.viewModel.weather?.clouds?.all ?? 0)%"
            self.degreeLabel.text = String(format:"%.0f°C", self.viewModel.weather?.main?.temp ?? 0)
            self.locationLabel.text = "\(self.viewModel.weather?.name ?? "")"
            self.weatherConditionsView.feelsLikeDegreeLabel.text = String(format:"%.0f°C", self.viewModel.weather?.main?.feelsLike ?? 0)
            self.weatherConditionsView.minTempDegreeLabel.text = String(format:"%.0f°C", self.viewModel.weather?.main?.tempMin ?? 0)
            self.weatherConditionsView.maxTempDegreeLabel.text = String(format:"%.0f°C", self.viewModel.weather?.main?.tempMax ?? 0)
            self.weatherConditionsView.windySpeedLabel.text = String(format:"%.1fm/s", self.viewModel.weather?.wind?.speed ?? 0)
            self.weatherConditionsView.cloudLevelLabel.text = "\(self.viewModel.weather?.clouds?.all ?? 0)%"
            self.weatherConditionsView.visibilityLabel.text = "\(self.viewModel.weather?.visibility ?? 0)m"
            self.weatherConditionsSecondView.humidityLevelLabel.text = "\(self.viewModel.weather?.main?.humidity ?? 0)%"
            self.weatherConditionsSecondView.pressureLevelLabel.text = "\(self.viewModel.weather?.main?.pressure ?? 0)hPa"
        }
    }
    
    func error(error: String) {
        let alert = UIAlertController(title: "Alert", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

