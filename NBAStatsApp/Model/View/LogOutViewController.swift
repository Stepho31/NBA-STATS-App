//
//  LogOutViewController.swift
//  
//
//  Created by Stephen on 6/9/22.
//

import UIKit
import FirebaseAuth

class LogOutViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .red
//        tableView.register(NbaTableViewCell.self, forCellReuseIdentifier: NbaTableViewCell.identifier)
        return tableView
    }()
//        let tableView = UITableView(frame: .zero, style: .grouped)
////        tableView.translatesAutoresizingMaskIntoConstraints = false
////        tableView.register(NbaTableViewCell.self, forCellReuseIdentifier: NbaTableViewCell.identifier)
//        return tableView
//    }()

    let data = ["Log Out"]
    
    let backgroundImage = UIImageView(image: UIImage(named: "NBA"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        backgroundImage.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImage.addSubview(blurEffectView)
        view.addSubview(backgroundImage)
//        tableView.backgroundView = backgroundImage
//        view.addSubview(tableView)
        
//        tableView.delegate = self
//        tableView.dataSource = self

        
    }
    
}
extension LogOutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in

            guard let strongSelf = self else {
                return
            }
            do {
                try FirebaseAuth.Auth.auth().signOut()
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                strongSelf.present(nav, animated: true)
            }
            catch {
                print("Failed to log out")
        }

        }))

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)

}
}

