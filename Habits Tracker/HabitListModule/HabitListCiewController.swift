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
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    init(presenter: HabitListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationBar() {
        title = ConstantText.habitTitle
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarApperance.backgroundColor = .clear
        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: ConstantImage.add),
            style: .done,
            target: self,
            action: #selector(addNewHabit))
        
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: ConstantImage.settingGear),
            style: .plain,
            target: self,
            action: #selector(showSettings))
        
        navigationItem.rightBarButtonItem?.tintColor = .red
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
    
    @objc private func addNewHabit() {
        presenter.addHabit()
    }
    
    @objc private func showSettings() {
        print("settings")
    }
}
//MARK: - HabitListViewProtocol
extension HabitListViewController: HabitListViewProtocol {
    
}

