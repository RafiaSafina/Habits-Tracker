//
//  HabitPresenter.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

protocol HabitViewProtocol: AnyObject {
    
}

protocol HabitPresenterPrototocol: AnyObject {
    func backToRoot()
}

final class HabitPresenter {
    weak var view: HabitViewProtocol?
    var router: RouterProtocol?
    let storageManager: StorageManagerProtocol
    
    init(router: RouterProtocol, storageManager: StorageManagerProtocol) {
        self.router = router
        self.storageManager = storageManager
    }
    
    func backToRoot() {
        router?.backToRoot()
    }
}
