//
//  DetailViewController.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/8/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var displayAffiliations: String?
    var standard: League?
    var temporaryDisplayName: String?
    var personId: String?
    var jersey: String?
    var fullName: String?
    
    
    let wholeNameLabel: UILabel = {
        let Label = UILabel(frame: .zero)
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.text = "Artist Name: "
        Label.textAlignment = .center
        Label.textColor = .white
//        Label.layer.borderColor = UIColor.white.cgColor
        Label.layer.borderWidth = 1.0
        Label.layer.masksToBounds = true
        Label.layer.cornerRadius = 20
        Label.layer.borderColor = UIColor.white.cgColor
//        Label.backgroundColor = .systemGray
        return Label
    }()
    let myImageView:UIImageView = {
        var img = UIImageView(frame: .zero)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 1
        img.clipsToBounds = true
//        img.layer.borderWidth = 1
//        img.layer.borderColor = UIColor.systemGray.cgColor
//        img.layer.cornerRadius = img.frame.height/20
        img.layer.shadowRadius = 5
        img.layer.shadowOpacity = 30.0
//        imageView.layer.shadowOffset = CGSize(width: 9, height: 3)
        img.layer.shadowColor = UIColor.black.cgColor
//        img.clipsToBounds = true
        return img
    }()
    let countryNameLabel: UILabel = {
        let albumLabel = UILabel(frame: .zero)
        albumLabel.text = "Album Name: "
        albumLabel.textAlignment = .center
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.textColor = .white
//        albumLabel.backgroundColor = .systemRed
        albumLabel.layer.borderColor = UIColor.white.cgColor
        albumLabel.layer.borderWidth = 1.0
        albumLabel.layer.masksToBounds = true
        albumLabel.layer.cornerRadius = 20
        return albumLabel
    }()
    let jerseyNum: UILabel = {
        let jerseyLabel = UILabel(frame: .zero)
        jerseyLabel.text = "Album Name: "
        jerseyLabel.textAlignment = .center
        jerseyLabel.translatesAutoresizingMaskIntoConstraints = false
        jerseyLabel.textColor = .white
//        jerseyLabel.backgroundColor = .systemBlue
        jerseyLabel.layer.borderColor = UIColor.white.cgColor
        jerseyLabel.layer.borderWidth = 1.0
        jerseyLabel.layer.masksToBounds = true
        jerseyLabel.layer.cornerRadius = 20
        return jerseyLabel
    }()
//    let teamNames: UILabel = {
//        let teamLabel = UILabel(frame: .zero)
//        teamLabel.text = "Album Name: "
//        teamLabel.textAlignment = .center
//        teamLabel.translatesAutoresizingMaskIntoConstraints = false
//        teamLabel.textColor = .white
//        return teamLabel
//    }()
    
    var networkManager: NetworkManager?
    
    let backgroundImage = UIImageView(image: UIImage(named: "NBA"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        backgroundImage.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImage.addSubview(blurEffectView)
        guard let img_url = personId else{
            return
        }
        guard let data = ImageCache.shared.getImageData(key: img_url) else {
            return
        }
        let img = UIImage(data: data)
        self.myImageView.image = img!

        view.addSubview(backgroundImage)
        view.addSubview(wholeNameLabel)
        view.addSubview(countryNameLabel)
        view.addSubview(myImageView)
        view.addSubview(jerseyNum)
//        view.addSubview(teamNames)

        self.wholeNameLabel.text = temporaryDisplayName?.capitalized
        self.countryNameLabel.text = displayAffiliations?.capitalized
        self.jerseyNum.text = jersey
//        self.teamNames.text = fullName?.capitalized

        

        wholeNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 550).isActive = true
        wholeNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        wholeNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        wholeNameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -225).isActive = true
//
        countryNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 630).isActive = true
        countryNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        countryNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        countryNameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        
        jerseyNum.topAnchor.constraint(equalTo: view.topAnchor, constant: 715).isActive = true
        jerseyNum.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        jerseyNum.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        jerseyNum.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55).isActive = true
//
        myImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true

    }
    

    

}
