//
//  FavoritesViewController.swift
//  
//
//  Created by Stephen on 6/10/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let backgroundImage = UIImageView(image: UIImage(named: "NBA"))

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImage.addSubview(blurEffectView)
        view.addSubview(backgroundImage)
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
