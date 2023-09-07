//
//  NewCategoryViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/30/23.
//

import UIKit

class NewCategoryViewController: UIViewController {
    
    private var viewModel: NewCategoryViewModel!
    
    init(viewModel: NewCategoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
