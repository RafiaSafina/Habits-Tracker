//
//  HabitsViewControllerCell.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

final class HabitListCell: UITableViewCell {
    
    static let reuseIdentifier = "HabitListCellID"
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "habit"
        label.configure()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let circleImage = UIImage(systemName: "circle")
    private let checkmarkOmage = UIImage(systemName: "checkmark")
    
    
    private lazy var isDone = false {
        didSet {
            isDone ? checkButton.setImage(checkmarkOmage, for: .normal)
            : checkButton.setImage(circleImage, for: .normal)
        }
    }
    
    private lazy var checkButton: UIButton = {
        let button  = UIButton(type: .custom)
        button.setImage(circleImage, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(checkButton)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            checkButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            checkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkButton.heightAnchor.constraint(equalToConstant: 20),
            checkButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc private func toggle() {
        self.isDone = !isDone
    }
    
    func configure(name: String, isDone: Bool) {
        nameLabel.text = name
        self.isDone = isDone
    }
}


