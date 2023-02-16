//
//  Router.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

protocol RouterMain {
    var rootViewController: UINavigationController? { get set }
    var habitListViewController: UITableViewController? { get set }
    var tamagochiViewController: UIViewController? { get set }
    var habitViewController: UIViewController? { get set }
    var tabBarController: CustomTabBarController? { get set }
    var navigationController: UINavigationController? { get set }
}

protocol RouterProtocol: RouterMain {
    func setupTabBarController()
    func showTamagochi()
    func showHabit()
}

class Router: RouterProtocol {
    
    var builder: BuilderProtocol
    
    var rootViewController: UINavigationController?
    var habitListViewController: UITableViewController?
    var tamagochiViewController: UIViewController?
    var habitViewController: UIViewController?
    var tabBarController: CustomTabBarController?
    var navigationController: UINavigationController?
    
    lazy private var storageManager: StorageManagerProtocol = StorageManager()
    
    init(rootViewController: UINavigationController,
         habitListViewController: UITableViewController,
         tamagochiViewController: UIViewController,
         habitViewController: UIViewController,
         tabBarController: CustomTabBarController,
         builder: BuilderProtocol) {
        
        self.rootViewController = rootViewController
        self.habitListViewController = habitListViewController
        self.tamagochiViewController = tamagochiViewController
        self.habitViewController = habitViewController
        self.tabBarController = tabBarController
        self.builder = builder
    }
    
    func setupTabBarController() {
        let habitListVC = UINavigationController(
            rootViewController: builder.createHabitsViewController(
                storageManager: storageManager,
                router: self))
        let tamagochiVC = UINavigationController(
            rootViewController: builder.createTamagochiViewController(
                storageManager: storageManager,
                router: self))
        
        tabBarController?.setViewControllers([
            generate(
                viewController: habitListVC,
                imageString: ConstantImage.habit,
                title: ConstantText.habit),
            generate(
                viewController: tamagochiVC,
                imageString: ConstantImage.tamagochi,
                title: ConstantText.tamagochi
            )], animated: true)
    }
    
    func showTamagochi() {
        let tanagochiVC = builder.createTamagochiViewController(storageManager: storageManager, router: self)
        rootViewController?.pushViewController(tanagochiVC, animated: true)
    }
    
    func showHabit() {
        let habitVC = builder.createHabitViewController(storageManager: storageManager, router: self)
        rootViewController?.pushViewController(habitVC, animated: true)
    }
    
    private func generate(viewController: UIViewController, imageString: String, title: String) -> UIViewController {
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageString), selectedImage: UIImage(named: imageString))
        
        return viewController
    }
}
