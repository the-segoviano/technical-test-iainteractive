//
//  HomeTabBarController.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startViewController = ViewController()
        startViewController.title = "Cartelera"
        startViewController.tabBarItem.image = UIImage(named: "home")
        
        let profileViewController = ViewController()
        profileViewController.title = "Perfil"
        profileViewController.tabBarItem.image = UIImage(named: "avatar")
        
        viewControllers = [startViewController, profileViewController]
    }
    
}
