//
//  CustomTabBarViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [HomeTabBarController.self])
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        }
}


