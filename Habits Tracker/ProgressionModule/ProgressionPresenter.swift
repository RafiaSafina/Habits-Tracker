//
//  CalendarPresenter.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 17.02.2023.
//

import UIKit

protocol ProgressionViewProtocol: AnyObject {
    
}

protocol ProgressionPresenterProtocol: AnyObject {

}

final class ProgressionPresenter: ProgressionPresenterProtocol {
    weak var view: ProgressionViewProtocol?
    var router: RouterProtocol?
    let storageManager: StorageManagerProtocol
    
    init(router: RouterProtocol, storageManager: StorageManagerProtocol) {
        self.router = router
        self.storageManager = storageManager
    }
}
