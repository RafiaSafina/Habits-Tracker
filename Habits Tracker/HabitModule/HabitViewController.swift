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
        setupNavBar()
        view.backgroundColor = .white
    }
    
    init(presenter: HabitPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavBar() {
        title = ConstantText.newHabitTitle
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarApperance.backgroundColor = .clear
        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToRoot))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHabit))
        
        navigationItem.rightBarButtonItem?.tintColor = .red
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
                                                           
    @objc private func backToRoot() {
        presenter.backToRoot()
    }
    
    @objc private func saveHabit() {
        print("save")
    }
    
    
}

extension HabitViewController: HabitViewProtocol {
    
}
