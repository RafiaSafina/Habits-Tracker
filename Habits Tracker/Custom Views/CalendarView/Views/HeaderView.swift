//
//  HeaderView.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 21.02.2023.
//

import UIKit

final class HeaderView: UIView {
    
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Month"
        label.accessibilityTraits = .header
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var previousMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ConstantImage.leftArrow), for: .normal)
        button.addTarget(self, action: #selector(didTapPreviousMonthButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ConstantImage.rightArrow), for: .normal)
        button.addTarget(self, action: #selector(didTapPreviousMonthButton), for: .touchUpInside)
        return button
    }()

    private lazy var dayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM y")
        return dateFormatter
    }()

    var baseDate = Date() {
        didSet {
          monthLabel.text = dateFormatter.string(from: baseDate)
      }
    }
    
    private let didTapLastMonthCompletionHandler: (() -> Void)
    private let didTapNextMonthCompletionHandler: (() -> Void)
    
    init(didTapLastMonthCompletionHandler: @escaping (() -> Void),
         didTapNextMonthCompletionHandler: @escaping (() -> Void)) {
        self.didTapLastMonthCompletionHandler = didTapLastMonthCompletionHandler
        self.didTapNextMonthCompletionHandler = didTapNextMonthCompletionHandler
             
        super.init(frame: CGRect.zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addSubview(monthLabel)
        addSubview(dayOfWeekStackView)
        addSubview(previousMonthButton)
        addSubview(nextMonthButton)
        
        for dayNumber in 1...7 {
          let dayLabel = UILabel()
          dayLabel.font = .systemFont(ofSize: 16, weight: .bold)
          dayLabel.textColor = .secondaryLabel
          dayLabel.textAlignment = .center
          dayLabel.text = dayOfWeekLetter(for: dayNumber)

          dayLabel.isAccessibilityElement = false
          dayOfWeekStackView.addArrangedSubview(dayLabel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func dayOfWeekLetter(for dayNumber: Int) -> String {
      switch dayNumber {
      case 1:
        return "M"
      case 2:
        return "T"
      case 3:
        return "W"
      case 4:
        return "T"
      case 5:
        return "F"
      case 6:
        return "S"
      case 7:
        return "S"
      default:
        return ""
      }
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      NSLayoutConstraint.activate([
        monthLabel.topAnchor.constraint(equalTo: topAnchor),
        monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

        dayOfWeekStackView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 10),
        dayOfWeekStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        dayOfWeekStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        previousMonthButton.topAnchor.constraint(equalTo: topAnchor),
        previousMonthButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        
        nextMonthButton.topAnchor.constraint(equalTo: topAnchor),
        nextMonthButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
      ])
    }
    
    @objc func didTapPreviousMonthButton() {
      didTapLastMonthCompletionHandler()
    }

    @objc func didTapNextMonthButton() {
      didTapNextMonthCompletionHandler()
    }
}
