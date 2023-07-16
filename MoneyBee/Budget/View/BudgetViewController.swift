//
//  BudgetViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/16/23.
//

import UIKit
import Stevia

class BudgetViewController: UIViewController {
    
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
    
    private var goals = [GoalModel(type: Category(name: "food"), goalName: "restaraunt", budgetAmount: 250, currentCosts: 200),
                              GoalModel(type: Category(name: "food"), goalName: "whole foods", budgetAmount: 1000, currentCosts: 100),
                              GoalModel(type: Category(name: "food"), goalName: "mcDonalds", budgetAmount: 100, currentCosts: 15),
                              GoalModel(type: Category(name: "bills"), goalName: "utilities", budgetAmount: 50, currentCosts: 10)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstrains()
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
        goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BudgetTableViewCell.cellID, for: indexPath) as? BudgetTableViewCell else {
            return UITableViewCell()
        }
        let goalItem = goals[indexPath.row]
        cell.cellConfigure(model: goalItem)
        cell.progressBar.changeTintColorProgressView()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
  
    
    
}

