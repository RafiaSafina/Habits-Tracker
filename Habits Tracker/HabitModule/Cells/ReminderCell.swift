//
//  ReminderCell.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 03.03.2023.
//

import Foundation
import UIKit

final class ReminderCell: UITableViewCell  {
    
    static let reuseIdentifier = "ReminderCellID"
    
    private let remindLabel: UILabel = {
        let label = UILabel()
        label.text = "remind me"
        label.configure()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var toggler: UISwitch = {
        let toggler = UISwitch()
        toggler.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        toggler.translatesAutoresizingMaskIntoConstraints = false
        return toggler
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(remindLabel)
        contentView.addSubview(toggler)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            remindLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            remindLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            remindLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        
            toggler.centerYAnchor.constraint(equalTo: centerYAnchor),
            toggler.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
    
    @objc func toggle() {
        print("toggle")
    }
}
