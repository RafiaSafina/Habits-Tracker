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
    var calendarViewController: UIViewController? { get set }
    var tabBarController: HomeTabBarController? { get set }
    var navigationController: UINavigationController? { get set }
}

protocol RouterProtocol: RouterMain {
    func setupTabBarController()
    func showTamagochi()
    func showHabit()
    func backToRoot()
}

class Router: RouterProtocol {
    
    var builder: BuilderProtocol
    
    var rootViewController: UINavigationController?
    var habitListViewController: UITableViewController?
    var tamagochiViewController: UIViewController?
    var habitViewController: UIViewController?
    var calendarViewController: UIViewController?
    var tabBarController: HomeTabBarController?
    var navigationController: UINavigationController?
    
    lazy private var storageManager: StorageManagerProtocol = StorageManager()
    
    init(rootViewController: UINavigationController,
         habitListViewController: UITableViewController,
         tamagochiViewController: UIViewController,
         habitViewController: UIViewController,
         calendarViewController: UIViewController,
         tabBarController: HomeTabBarController,
         builder: BuilderProtocol) {
        
        self.rootViewController = rootViewController
        self.habitListViewController = habitListViewController
        self.tamagochiViewController = tamagochiViewController
        self.habitViewController = habitViewController
        self.calendarViewController = calendarViewController
        self.tabBarController = tabBarController
        self.builder = builder
    }
    
    func setupTabBarController() {
        let habitListVC = UINavigationController(
            rootViewController: builder.createHabitsViewController(
                storageManager: storageManager,
                router: self))
        let progressionVC = UINavigationController(
            rootViewController: builder.createProgressionViewController(
                storageManager: storageManager,
                router: self))
        let tamagochiVC = UINavigationController(
            rootViewController: builder.createTamagochiViewController(
                storageManager: storageManager,
                router: self))
        
        tabBarController?.setViewControllers([
            generate(
                viewController: habitListVC,
                imageString: ConstantImage.home,
                title: ConstantString.home),
            generate(viewController: progressionVC,
                     imageString: ConstantImage.list,
                     title: ConstantString.progression),
            generate(
                viewController: tamagochiVC,
                imageString: ConstantImage.tamagochi,
                title: ConstantString.tamagochi
            )], animated: true)
    }
    
    func showTamagochi() {
        let tamagochiVC = builder.createTamagochiViewController(storageManager: storageManager, router: self)
        rootViewController?.pushViewController(tamagochiVC, animated: true)
    }
    
    func showHabit() {
        let habitVC = UINavigationController(rootViewController: builder.createHabitViewController(
            storageManager: storageManager,
            router: self))
        habitVC.modalPresentationStyle = .pageSheet
        rootViewController?.present(habitVC, animated: true)
    }
    
    func backToRoot() {
        if let rootViewController = rootViewController {
            rootViewController.presentedViewController?.dismiss(animated: true)
        }
    }
    
    private func generate(viewController: UIViewController, imageString: String, title: String) -> UIViewController {
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageString), selectedImage: UIImage(named: imageString))
        
        return viewController
    }
}
