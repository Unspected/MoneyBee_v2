//
//  AccountViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/30/23.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var viewModel: AccountViewModel!
    
    init(viewModel: AccountViewModel) {
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
