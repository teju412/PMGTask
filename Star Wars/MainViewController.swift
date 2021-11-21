//
//  MainViewController.swift
//  Star Wars
//
//  Created by TejaDanasvi on 19/11/21.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // set tab height
        let kBarHeight = CGFloat(100)
        self.tabBar.frame.size.height = kBarHeight
        self.tabBar.frame.origin.y = view.frame.height - kBarHeight
    }

    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        
        // create tabs
        let filmsTab = UINavigationController(rootViewController: FilmsListViewController())
        let starshipsTab = UINavigationController(rootViewController: StarshipsListViewController())
        
        // set titles
        filmsTab.title = "films"
        starshipsTab.title = "starships"
        
        // add tabs
        let tabs = [filmsTab,starshipsTab]
        super.setViewControllers(tabs, animated: animated)
        
        // set tab images
        self.tabBar.items?[0].image = UIImage(named: "film-slate-inactive")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[0].selectedImage = UIImage(named: "film-slate")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[1].image = UIImage(named: "spaceship-inactive")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[1].selectedImage = UIImage(named: "spaceship")?.withRenderingMode(.alwaysOriginal)
    }
}
