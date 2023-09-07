//
//  AddViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/30/23.
//

import UIKit

class AddViewController: UIViewController {
    
    private var viewModel: AddViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init(viewModel: AddViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
