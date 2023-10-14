//
//  NewSavingGoalViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/30/23.
//

import UIKit

class NewSavingGoalViewController: UIViewController {
    
    private var viewModel: NewSavingGoalModel!
    
    init(viewModel: NewSavingGoalModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        setupViews()
    }
    
}

extension NewSavingGoalViewController {
    
    private func setupViews() {
        view.backgroundColor = .darkGray
    }
}
