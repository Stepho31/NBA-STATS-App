//
//  NbaTableViewCell.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/3/22.
//

import UIKit
import CoreData
import Foundation

struct NbaTableViewCellViewModel {
    let displayAffiliation: String
    let personId: String
    let temporaryDisplayName: String
    let jersey: String
    let dateOfBirthUTC: String
    let fullName: String

    
}

class NbaTableViewCell: UITableViewCell {

    static let identifier = "NbaTableViewCell"
    
    private let temporaryDisplayNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "San Francisco", size: 300)
        label.font = label.font.withSize(20)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1.0
        return label
    }()

    private let displayAffiliationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "San Francisco", size: 20)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.textColor = .white
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1.0
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    private let favoriteButtonLabel: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Star"), for: .normal)
        button.addTarget(self, action: #selector(didTapFavorite), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nbaImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOpacity = 7.0
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    let viewModel = NbaTableViewCellViewController()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.addSubview(temporaryDisplayNameLabel)
        contentView.addSubview(displayAffiliationLabel)
        contentView.addSubview(favoriteButtonLabel)
        contentView.addSubview(nbaImageView)
        
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        temporaryDisplayNameLabel.sizeToFit()
        displayAffiliationLabel.sizeToFit()
        favoriteButtonLabel.sizeToFit()
        
        
        self.temporaryDisplayNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        self.temporaryDisplayNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -430).isActive = true
        self.temporaryDisplayNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100).isActive = true
        self.temporaryDisplayNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -100).isActive = true



        self.displayAffiliationLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 435).isActive = true
        self.displayAffiliationLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
        self.displayAffiliationLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100).isActive = true
        self.displayAffiliationLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -100).isActive = true
       
        self.favoriteButtonLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 425).isActive = true
        self.favoriteButtonLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 330).isActive = true
        self.favoriteButtonLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        self.favoriteButtonLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true

        
        self.nbaImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        self.nbaImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100).isActive = true
        self.nbaImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -100).isActive = true
        self.nbaImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -65).isActive = true
        

    }
    
    
    @objc private func unTapFavorite() {
        
        self.viewModel.deleteAllData(entity: "Favorites")
        print("Deleted")
        
        
    }
    @objc private func didTapFavorite() {
        self.viewModel.save()

            
        }
    func configure(with viewModel: NbaTableViewCellViewModel) {
        temporaryDisplayNameLabel.text = viewModel.temporaryDisplayName
        
        let networkManager = NetworkManager()
        

        displayAffiliationLabel.text = viewModel.displayAffiliation
       
        
        networkManager.fetchImageData(id:viewModel.personId) { results in
            switch results {
            case .success(let picture):
                
                DispatchQueue.main.async {
                    self.nbaImageView.image = UIImage(data:picture)
            }
                ImageCache.shared.setImageData(key: viewModel.personId, data: picture)
            case .failure(let err):
                print("Error: \(err.localizedDescription)")
                }
            
                
            }
        
                
        }
            
        
    }







