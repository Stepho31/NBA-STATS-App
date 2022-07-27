//
//  SearchViewController.swift
//  
//
//  Created by Stephen on 6/8/22.
//

import UIKit

private var viewModels = [NbaTableViewCellViewModel]()



class ResultsVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NbaTableViewCell.self, forCellReuseIdentifier: NbaTableViewCell.identifier)
        return tableView
    }()
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .black
        spinner.alpha = 0.0
        return spinner
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)

        
    }
}

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: ResultsVC())
    
    let backgroundImage = UIImageView(image: UIImage(named: "NBA"))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImage.addSubview(blurEffectView)
        view.addSubview(backgroundImage)
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .green
        print(text)
    }



}
extension ResultsVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.spinner.startAnimating()
        self.spinner.alpha = 1.0

    }
    
}

