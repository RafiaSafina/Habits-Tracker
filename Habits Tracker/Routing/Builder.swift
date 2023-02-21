//
//  Builder.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createHabitsViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UITableViewController
    
    func createTamagochiViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UIViewController
    
    func createHabitViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UIViewController
    
    func createProgressionViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UIViewController
}

struct Builder: BuilderProtocol {
    func createHabitsViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UITableViewController {
        let presenter = HabitListPresenter(router: router, storageManager: storageManager)
        let view = HabitListViewController(presenter: presenter)
        
        return view
    }
    
    func createTamagochiViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UIViewController {
        let presenter = TamagochiPresenter(router: router, storageManager: storageManager)
        let view = TamagochiViewController(presenter: presenter)
        
        return view
    }
    
    func createHabitViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UIViewController {
        let presenter = HabitPresenter(router: router, storageManager: storageManager)
        let view = HabitViewController(presenter: presenter)
        
        return view
    }
    
    func createProgressionViewController(storageManager: StorageManagerProtocol, router: RouterProtocol) -> UIViewController {
        let presenter = ProgressionPresenter(router: router, storageManager: storageManager)
        let view = ProgressionViewController(presenter: presenter)
        
        return view
    }
}
