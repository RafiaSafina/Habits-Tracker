//
//  ReminderCell.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 03.03.2023.
//

import UIKit

final class FrequenyCell: UITableViewCell {

    static var reuseIdentifier = "reminderCellID"
    
    private let remindLabel: UILabel = {
        let label = UILabel()
        label.text = "remind"
        label.configure()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var frequencyLabel: UILabel = {
        let label = UILabel()
        label.text = "every day"
        label.configure()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var rightArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(remindLabel)
        contentView.addSubview(frequencyLabel)
        contentView.addSubview(rightArrowImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(frequency: String) {
        frequencyLabel.text = frequency
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            remindLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            remindLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            remindLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            rightArrowImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            rightArrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowImageView.heightAnchor.constraint(equalToConstant: 20),
            
            frequencyLabel.rightAnchor.constraint(equalTo: rightArrowImageView.leftAnchor),
            frequencyLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            frequencyLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
