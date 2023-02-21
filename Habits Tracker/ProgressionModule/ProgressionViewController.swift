//
//  CalendarPickerViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 16.02.2023.
//

import UIKit

final class ProgressionViewController: UIViewController {
    
    private let presenter: ProgressionPresenter
    
    private let calendarView = CalendarView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//    private let calendarView = CalendarView()
                                            
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        NSLayoutConstraint.activate([
            calendarView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            calendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
