//
//  DetailsTableViewCell.swift
//  WeatherApp
//
//  Created by Oliwia Procyk on 11/05/2023.
//

import UIKit
import SnapKit

final class DetailsTableViewCell: UITableViewCell {    
    let backgroundImageView = UIImageView()
    var collectionView: UICollectionView!
    var details: [Hour] = []
    var section: Int?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCollectionView()
        configureBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBackground() {
        backgroundImageView.image = Images.backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        collectionView.backgroundView = backgroundImageView
        collectionView.backgroundView?.alpha = 0.7
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
        
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: ReuseIDs.collectionViewCell)
        
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func setCell(details: [Hour], section: Int) {
        DispatchQueue.main.async {
            self.section = section
            self.details = details
            self.collectionView.reloadData()
        }
    }
}

extension DetailsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIDs.collectionViewCell, for: indexPath) as! DetailsCollectionViewCell
        
        let startIndex = (section ?? 0) * 24
        let endIndex = startIndex + 24
        
        if startIndex < details.count {
            let subarray = Array(details[startIndex..<min(endIndex, details.count)])
            let detail = subarray[indexPath.row % 24]
            
            switch section {
            case 0, 1, 2:
                cell.degreeLabel.text = "\(detail.tempC ?? 0)°C"
                cell.textLabel.text = detail.condition?.text
                
                let dateTimeString = detail.time ?? ""
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-mm-dd HH:mm"
                
                if let dateTime = dateFormatter.date(from: dateTimeString) {
                    dateFormatter.dateFormat = "HH.mm"
                    let formattedTime = dateFormatter.string(from: dateTime)
                    
                    cell.hourLabel.text = formattedTime
                } else {
                    cell.hourLabel.text = "Invalid time"
                }
            default:
                print("Someting went wrong.")
            }
        }
        return cell
    }
}


