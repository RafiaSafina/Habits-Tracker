//
//  HabitViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

class HabitViewController: UIViewController {

    private let presenter: HabitPresenter
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(presenter: HabitPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HabitViewController: HabitViewProtocol {
    
}
