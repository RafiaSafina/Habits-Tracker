//
//  ViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

final class HabitListViewController: UITableViewController {
    
    private let presenter: HabitListPresenter
    
    private let habits = TestingData().habits
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        tableView.register(HabitListCell.self, forCellReuseIdentifier: HabitListCell.reuseIdentifier)
    }
    
    init(presenter: HabitListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationBar() {
        title = ConstantString.habitTitle
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarApperance.backgroundColor = .clear
        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
        
        let addBUtton = UIBarButtonItem(
            image: UIImage(named: ConstantImage.add),
            style: .done,
            target: self,
            action: #selector(addNewHabit))
       
        navigationItem.rightBarButtonItem = addBUtton

        addBUtton.tintColor = .red
    }
    
    @objc private func addNewHabit() {
        presenter.addHabit()
    }
    
    @objc private func showSettings() {
        print("settings")
    }
}
//MARK: - UITableViewDataSource
extension HabitListViewController {
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitListCell.reuseIdentifier, for: indexPath) as? HabitListCell else { return UITableViewCell() }
        let habit = habits[indexPath.row]
        cell.configure(name: habit.name, isDone: habit.isDone)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: - HabitListViewProtocol
extension HabitListViewController: HabitListViewProtocol {
    
}

