//
//  HabitNameCell.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 03.03.2023.
//

import Foundation
import UIKit

class HabitNameCell: UITableViewCell {
    
    static let reuseIdentifier = "NewHabit"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let label: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.configure()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "add habit name"
        textField.adjustsFontSizeToFitWidth = true
        textField.textColor = .lightGray
        textField.font = UIFont(name: "", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor),
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
