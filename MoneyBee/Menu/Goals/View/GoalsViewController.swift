//
//  GoalsViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/30/23.
//

import UIKit

class GoalsViewController: UIViewController {
    
    private var viewModel: GoalsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(viewModel: GoalsViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
