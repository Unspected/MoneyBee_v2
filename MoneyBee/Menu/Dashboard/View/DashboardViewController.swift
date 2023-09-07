//
//  DashboardViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/30/23.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private var viewModel: DashboardViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(viewModel: DashboardViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
