//
//  TabBarController.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 25.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let homePageVC = MoviesSeriesVC()
    private let moviesVC = HomePageVC()
    private let myCollectionVC = MyCollectionVC()
    private let segmentedVC = SegmentedControllerVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)


        viewControllers = [   createTabBarController(title: "Home", imageName: "HomePage", vc: moviesVC),
                              createTabBarController(title: "Movies ", imageName: "Movies", vc: segmentedVC),
                              createTabBarController(title: "My Collection", imageName: "Collection", vc: myCollectionVC)]
    }
    
    private func createTabBarController(title: String, imageName: String, vc: UIViewController) -> UINavigationController{
        let recentVC = UINavigationController(rootViewController: vc)
        recentVC.tabBarItem.title = title
        recentVC.tabBarItem.image = UIImage(named: imageName)
        return recentVC
    }
}
