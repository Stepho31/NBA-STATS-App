//
//  TabBarViewController.swift
//  
//
//  Created by Stephen on 6/10/22.
//

import UIKit

class TabViewController: UIViewController {

    lazy var tabMenuControl: UITabBarController = {
        let tabmenu = UITabBarController()
        return tabmenu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabMenuUI()
        tabMenuControl.tabBar.barTintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().barTintColor = .clear
        
       


    }
    
    
    private func setupTabMenuUI() {
        createTabBarController()
    }
    
    private func createTabBarController(){
        
        let firstViewController = ViewController()
        firstViewController.title = "STATS"
        firstViewController.tabBarItem = UITabBarItem.init(title: "NBA PLAYER STATS", image: UIImage(systemName: "list.bullet.rectangle.fill"), tag: 0)
        
        
        let secondViewController =  SearchViewController()
        secondViewController.title = "Favorite Albums"
        secondViewController.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        let thirdViewController = LogOutViewController()
        thirdViewController.title = "Log Out"
        thirdViewController.tabBarItem = UITabBarItem.init(title: "Log Out", image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), tag: 0)
        
        let controllerArray = [firstViewController, secondViewController, thirdViewController]
        self.tabMenuControl.viewControllers = controllerArray.map{UINavigationController.init(rootViewController: $0)}
        
        let attrNavbar = [
          NSAttributedString.Key.font: UIFont(name: "Georgia", size: 35)!
        ]
        

        UINavigationBar.appearance().titleTextAttributes = attrNavbar
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Georgia", size: 10)!], for: .normal)
        
        
        
        self.view.addSubview(self.tabMenuControl.view)
    }
    
    
}

