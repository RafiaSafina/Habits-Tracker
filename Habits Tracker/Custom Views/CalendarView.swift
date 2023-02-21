//
//  CalendarView.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 17.02.2023.
//

import UIKit


final class CalendarView: UIView {
    
    private lazy var headerViewHeight = frame.height / 4
    private lazy var bodyVeiwHeight = headerViewHeight * 3
    private lazy var viewWidth = frame.width
    
    private lazy var leftButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: viewWidth / 5 , height: viewWidth / 5)
        button.setImage(UIImage(named: ConstantImage.leftArrow), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: viewWidth / 5, height: viewWidth / 5)
        button.setImage(UIImage(named: ConstantImage.rightArrow), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: viewWidth - 2 * (viewWidth / 5), height: viewWidth / 5)
        label.text = "May"
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: headerViewHeight))
        headerView.backgroundColor = .systemRed
        headerView.addSubview(leftButton)
        headerView.addSubview(rightButton)
        headerView.addSubview(monthLabel)
        return headerView
    }()
    
    private lazy var bodyView: UIView = {
        let bodyView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: bodyVeiwHeight))
        bodyView.backgroundColor = .lightGray
        return bodyView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(headerView)
        addSubview(bodyView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            monthLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            monthLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),

            leftButton.topAnchor.constraint(equalTo: leftButton.topAnchor),
            leftButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            leftButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

            rightButton.topAnchor.constraint(equalTo: headerView.topAnchor),
            rightButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            rightButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bodyView.topAnchor.constraint(equalTo: headerView.topAnchor),
            bodyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bodyView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

