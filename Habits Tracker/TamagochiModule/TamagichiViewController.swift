//
//  TamagichiViewController.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 15.02.2023.
//

import UIKit

final class TamagochiViewController: UIViewController {
    
    private let presenter: TamagochiPresenter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    init(presenter: TamagochiPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TamagochiViewController: TamagochiViewProtocol {
    
}
