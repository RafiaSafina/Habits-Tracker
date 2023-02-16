//
//  ViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

final class HabitListViewController: UITableViewController {
    
    private let presenter: HabitListPresenter
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(presenter: HabitListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HabitListViewController: HabitListViewProtocol {
    
}

