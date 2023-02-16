//
//  HabitViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

class HabitViewController: UITableViewController {

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
        title = ConstantString.newHabitTitle
        
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

//MARK: - TableViewDataSource
extension HabitViewController {
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        Numbs.habitSections
//    }
//    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return HabitSectionsTitles.habitName
//        case 1:
//            return HabitSectionsTitles.frequency
//        case 2:
//            return HabitSectionsTitles.color
//        default:
//            return ""
//        }
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Numbs.habitRows
//    }
}

//MARK: - HabitViewProtocol
extension HabitViewController: HabitViewProtocol {
    
}
