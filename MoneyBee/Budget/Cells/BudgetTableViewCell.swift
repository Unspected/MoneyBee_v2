
import UIKit
import Stevia

class BudgetTableViewCell: UITableViewCell {
    
    static let cellID = "cell"
    
    let backgroundCell: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 10
       return view
    }()
    
    let goalNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .whiteColor
        label.text = "TextLabel"
        return label
    }()
    
    let currentBalanceLabel: UILabel = {
       let label = UILabel()
        label.text = "Left"
        label.textColor = .white
        return label
    }()
    
    private var stackViewHeader: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = .whiteColor
        progressView.progress = 0.3
        progressView.layer.cornerRadius = 10
        progressView.changeTintColorProgressView()
        return progressView
    }()
    
    let budgetAmountLabel: UILabel = {
       let label = UILabel()
        label.text = "$50.00"
        label.textColor = .white
        return label
    }()
    
    private var stackViewFooter: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfigure(model: GoalModel) {
        self.goalNameLabel.text = model.goalName
        self.currentBalanceLabel.text = "Left" // Если мы в рамках бюджета писать left если вышли то нужно изменить надпись на другую ? подумать
        self.progressBar.progress = model.currentCosts / model.budgetAmount
        self.budgetAmountLabel.text = "$\(Int(model.budgetAmount))"
       
    }
    
    private func setupViews() {
        
        stackViewHeader.arrangedSubviews([goalNameLabel,currentBalanceLabel])
        stackViewFooter.arrangedSubviews([progressBar, budgetAmountLabel])
        backgroundColor = .clear
        

        
        // add subviews to view
        backgroundCell.subviews {
            stackViewHeader
            stackViewFooter
        }
        
        self.subviews {
            backgroundCell
        }
    }
    
    private func setupConstrains() {
        
        
        backgroundCell.layout {
            5
            |-10-stackViewHeader-25-| ~ 30
            10
            |-10-stackViewFooter-25-| ~ 30
            
        }
        
        self.layout {
            0
            |backgroundCell| ~ 100%
            10
        }
    }


}

