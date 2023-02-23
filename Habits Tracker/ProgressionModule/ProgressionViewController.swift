//
//  CalendarPickerViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 16.02.2023.
//

import UIKit

final class ProgressionViewController: UIViewController {
    
    private let presenter: ProgressionPresenter
               
    private lazy var customView = CalendarView(baseDate: Date()) { date in
        print("p")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
        NSLayoutConstraint.activate([
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            customView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
    }
    
    init(presenter: ProgressionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - ProgressionViewProtocol
extension ProgressionViewController: ProgressionViewProtocol {
    
}



