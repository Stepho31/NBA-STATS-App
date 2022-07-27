//
//  ViewController.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/3/22.
//

import UIKit
import CoreData
import FirebaseAuth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {



    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NbaTableViewCell.self, forCellReuseIdentifier: NbaTableViewCell.identifier)
        return tableView
    }()
    private let imageViews: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()



    private var viewModels = [NbaTableViewCellViewModel]()
    var login = LoginViewController()

    let backgroundImage = UIImageView(image: UIImage(named: "NBA"))

    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.backgroundColor = .systemRed
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        backgroundImage.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImage



        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImage.addSubview(blurEffectView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        NetworkManager.APICaller.shared.getAllNbaData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.league.standard.compactMap({
                    NbaTableViewCellViewModel(displayAffiliation: $0.teamSitesOnly?.displayAffiliation ?? "N/A", personId: $0.personId ?? "N/A", temporaryDisplayName: $0.temporaryDisplayName ?? "N/A", jersey: $0.jersey ?? "N/A", dateOfBirthUTC: $0.dateOfBirthUTC ?? "N/A", fullName: $0.fullName ?? "N/A")
                    

                })

                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validateAuth()
        
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
    
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NbaTableViewCell.identifier, for: indexPath) as? NbaTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let VCDetail = DetailViewController()
        let temporaryDisplayName = viewModels[indexPath.row].temporaryDisplayName
        let displayAffiliations = viewModels[indexPath.row].displayAffiliation
        let pictures = viewModels[indexPath.row].personId
        let jerseyNum = viewModels[indexPath.row].jersey
        let teamName = viewModels[indexPath.row].fullName
        VCDetail.temporaryDisplayName = temporaryDisplayName
        VCDetail.displayAffiliations = displayAffiliations
        VCDetail.personId = pictures
        VCDetail.jersey = jerseyNum
        VCDetail.fullName = teamName
        self.present(VCDetail, animated: true)

        }
    
}


