//
//  BudgetViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/16/23.
//

import UIKit
import Stevia
import Combine

class BudgetViewController: UIViewController {
    
    private var viewModel: BudgetViewModel!
    
    private var cancellable = Set<AnyCancellable>()
    
    private let headerView: UIView = {
       let view = UIView()
       view.backgroundColor = .gray
       return view
    }()
    
    private let imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoHeader")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()

    
    init(viewModel: BudgetViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstrains()
        bind()
    }
    
    private func bind() {
        
        viewModel.goals.sink { _ in
            self.tableView.reloadData()
        }.store(in: &cancellable)
    }
    
    
    private func setupViews() {
        view.backgroundColor = .darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BudgetTableViewCell.self, forCellReuseIdentifier: BudgetTableViewCell.cellID)
        
        headerView.subviews {
            imageViewLogo
        }
        
        view.subviews {
            headerView
            tableView
        }
        
    }
    
    private func setupConstrains() {
        headerView.layout {
            imageViewLogo.bottom(0).centerHorizontally().height(70)
        }
        
        view.layout([
            headerView.height(20%).left(0).right(0).top(0),
            10%,
            tableView.left(10).right(10).bottom(0)
        ])
        
    }
    
}


extension BudgetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.goals.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BudgetTableViewCell.cellID, for: indexPath) as? BudgetTableViewCell else {
            return UITableViewCell()
        }
        let goalItem = viewModel.goals.value[indexPath.row]
        cell.cellConfigure(model: goalItem)
        cell.progressBar.changeTintColorProgressView()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
  
    
    
}

