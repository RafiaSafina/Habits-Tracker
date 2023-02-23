//
//  CalendarDateCollectionViewCell.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 17.02.2023.
//

import UIKit

final class CalendarDateCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CalendarDateCollectionViewCell.self)
    
    private lazy var selectionBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    private lazy var accessibilityDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")
        return dateFormatter
    }()
    
    var day: Day? {
        didSet {
            guard let day = day else { return }
            numberLabel.text = day.number
            accessibilityLabel = accessibilityDateFormatter.string(from: day.date)
            updateSelectionStatus()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isAccessibilityElement = true
        accessibilityTraits = .button
        
        selectionBackgroundView.addSubview(numberLabel)
        contentView.addSubview(selectionBackgroundView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.deactivate(selectionBackgroundView.constraints)
        
        NSLayoutConstraint.activate([
            numberLabel.centerYAnchor.constraint(equalTo: selectionBackgroundView.centerYAnchor),
            numberLabel.centerXAnchor.constraint(equalTo: selectionBackgroundView.centerXAnchor),
            
            selectionBackgroundView.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
            selectionBackgroundView.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor),
            selectionBackgroundView.widthAnchor.constraint(equalToConstant: frame.width),
            selectionBackgroundView.heightAnchor.constraint(equalTo: selectionBackgroundView.widthAnchor)
        ])
        selectionBackgroundView.layer.cornerRadius = frame.width / 2
    }
    
    override func traitCollectionDidChange(
        _ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      layoutSubviews()
    }
    
    private func updateSelectionStatus() {
        guard let day = day else { return }
        
        if day.isSelected {
        applySelectedStyle()
      } else {
        applyDefaultStyle(isWithinDisplayedMonth: day.isWithinDisplayedMonth)
      }
    }
    
    func applySelectedStyle() {
        accessibilityTraits.insert(.selected)
        accessibilityHint = nil
        numberLabel.textColor = .label
        selectionBackgroundView.backgroundColor = .systemRed.withAlphaComponent(0.9)
        
    }
    
    func applyDefaultStyle(isWithinDisplayedMonth: Bool) {
        accessibilityTraits.remove(.selected)
        accessibilityHint = "Tap to select"

        numberLabel.textColor = isWithinDisplayedMonth ? .label : .secondaryLabel
        selectionBackgroundView.backgroundColor = .white
    }
}
