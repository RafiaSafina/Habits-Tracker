//
//  TamagochiPresenter.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

protocol TamagochiViewProtocol: AnyObject {
    
}

protocol TamagochiPresenterProtocol: AnyObject {
    
}

final class TamagochiPresenter: TamagochiPresenterProtocol  {
    
    weak var view: TamagochiViewProtocol?
    var router: RouterProtocol?
    let storageManager: StorageManagerProtocol
    
    init(router: RouterProtocol, storageManager: StorageManagerProtocol) {
        self.router = router
        self.storageManager = storageManager
    }
}
