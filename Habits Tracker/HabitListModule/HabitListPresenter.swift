//
//  HabitsPresenter.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

protocol HabitListViewProtocol: AnyObject {
    
}

protocol HabitListPresenterProtocol: AnyObject {
    
}

final class HabitListPresenter: HabitListPresenterProtocol {
    weak var view: HabitListViewProtocol?
    var router: RouterProtocol?
    let storageManager: StorageManagerProtocol
    
    init(router: RouterProtocol, storageManager: StorageManagerProtocol) {
        self.router = router
        self.storageManager = storageManager
    }
}
