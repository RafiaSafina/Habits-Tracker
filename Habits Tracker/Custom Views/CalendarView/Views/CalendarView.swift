//
//  CalendarView.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 17.02.2023.
//

import UIKit

final class CalendarView: UIView {
     
    private let calendarHelper = CalendarHelper()
    
    private lazy var headerView = HeaderView(
        didTapLastMonthCompletionHandler: {
            [weak self] in guard let self = self else { return }
            self.baseDate = self.calendarHelper.showPreviousMonth(date: self.baseDate)
        }, didTapNextMonthCompletionHandler: {
            [weak self] in guard let self = self else { return }
            self.baseDate = self.calendarHelper.showNextMonth(date: self.baseDate)
        })
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
// MARK: Calendar Data Values
    private var selectedDate = Date()
    private var baseDate: Date {
      didSet {
          collectionView.reloadData()
          days = calendarHelper.generateDaysInMonth(baseDate: baseDate)
          headerView.baseDate = baseDate
      }
    }

    private lazy var days = calendarHelper.generateDaysInMonth(baseDate: baseDate)
    private let selectedDateChanged: ((Date) -> Void)
    
//Initialization
    init(baseDate: Date, selectedDateChanged: @escaping ((Date) -> Void)) {
      self.selectedDate = baseDate
      self.baseDate = baseDate
      self.selectedDateChanged = selectedDateChanged

      super.init(frame: CGRect.zero)
    
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerView)
        addSubview(collectionView)
        collectionView.register(CalendarDateCollectionViewCell.self, forCellWithReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        headerView.baseDate = baseDate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
//MARK: - UICollectionViewDataSource
extension CalendarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let day = days[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier,
            for: indexPath) as! CalendarDateCollectionViewCell
        
        cell.day = day
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let day = days[indexPath.row]
        selectedDateChanged(day.date)
        print(day)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width)  / 7
        let height = Int(collectionView.frame.height) / 5
        return CGSize(width: width, height: height)
    }
}
