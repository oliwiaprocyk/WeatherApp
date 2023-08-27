//
//  DetailsVC.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 10/05/2023.
//

import UIKit
import SnapKit

final class DetailsVC: UIViewController {
    private let backgroundImageView = UIImageView()
    private let tableView = UITableView()
    private let viewModel = DetailsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func configureVC() {
        viewModel.delegate = self
        if let cityName = viewModel.cityName {
            viewModel.getDetails(cityName: cityName)
        }
        backgroundImageView.image = Images.backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImageView
        
        configureTableView()
    }
    
    func getCityName(cityName: String) {
        self.viewModel.cityName = cityName
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: ReuseIDs.tableViewCell)
        tableView.isScrollEnabled = true
        tableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}

extension DetailsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIDs.tableViewCell) as! DetailsTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.setCell(details: viewModel.details, section: 0)
        case 1:
            cell.setCell(details: viewModel.details, section: 1)
        case 2:
            cell.setCell(details: viewModel.details, section: 2)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Today"
        case 1: return "Tomorrow"
        case 2: return "The day after tomorrow"
        default: return "No more titles"
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let titleLabel = UILabel()
        let dateLabel = UILabel()
        
        titleLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        titleLabel.textColor = .secondaryLabel
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        dateLabel.textColor = .tertiaryLabel
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        headerView.addSubview(dateLabel)
        headerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerView.snp.leading)
            make.top.equalTo(headerView.snp.top)
            make.bottom.equalTo(headerView.snp.bottom)
            make.width.equalTo(200)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top)
            make.trailing.equalTo(headerView.snp.trailing)
            make.bottom.equalTo(headerView.snp.bottom)
            make.width.equalTo(100)
        }
        
        let calendar = Calendar.current
        if let today = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)
            let dayAfterTomorrow = calendar.date(byAdding: .day, value: 2, to: today)
            
            let todayString = dateFormatter.string(from: today)
            let tomorrowString = dateFormatter.string(from: tomorrow ?? today)
            let dayAfterTomorrowString = dateFormatter.string(from: dayAfterTomorrow ?? today)
            
            if section == 0 {
                dateLabel.text = todayString
            } else if section == 1 {
                dateLabel.text = tomorrowString
            } else if section == 2 {
                dateLabel.text = dayAfterTomorrowString
            } else {
                dateLabel.text = ""
            }
        } else {
            dateLabel.text = ""
        }
        
        return headerView
    }
}

extension DetailsVC: DetailsVMDelegate {    
    func success() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func error(error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
