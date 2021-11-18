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
        
        let startViewController = CarteleraViewController()
        startViewController.title = "Cartelera"
        startViewController.tabBarItem.image = UIImage(named: "home")
        
        let profileViewController = ProfileUserViewController()
        profileViewController.title = "Perfil"
        profileViewController.tabBarItem.image = UIImage(named: "avatar")
        
        viewControllers = [startViewController, profileViewController]
    }
    
}
