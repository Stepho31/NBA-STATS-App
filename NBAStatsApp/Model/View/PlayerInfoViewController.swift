//
//  PlayerInfoViewController.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/7/22.
//

import UIKit

class PlayerInfoViewController: UIViewController {

    private let mainTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.backgroundColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
