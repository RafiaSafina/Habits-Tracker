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
        tableView.register(HabitNameCell.self, forCellReuseIdentifier: HabitNameCell.reuseIdentifier)
        tableView.register(FrequenyCell.self, forCellReuseIdentifier: FrequenyCell.reuseIdentifier)
        tableView.register(ReminderCell.self, forCellReuseIdentifier: ReminderCell.reuseIdentifier)
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitNameCell.reuseIdentifier, for: indexPath) as? HabitNameCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FrequenyCell.reuseIdentifier, for: indexPath) as? FrequenyCell else { return UITableViewCell() }
            cell.configure(frequency: "every day")
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReminderCell.reuseIdentifier, for: indexPath) as? ReminderCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 110
        case 1: return 50
        case 2: return 50
        default: return 0
        }
    }
}

//MARK: - HabitViewProtocol
extension HabitViewController: HabitViewProtocol {
    
}
