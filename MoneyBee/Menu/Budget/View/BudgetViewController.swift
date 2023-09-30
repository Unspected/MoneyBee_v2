
import UIKit
import Stevia
import Combine

class BudgetViewController: UIViewController {
    
    private var viewModel: BudgetViewModel!
    
    private var cancellable = Set<AnyCancellable>()
    
    private var category = PassthroughSubject<String, Never>()
    
    private var createNewCategory: UIButton = {
       let button = UIButton()
        button.setTitle("Create new Budget", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    private var cells: [GoalModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        setupViews()
        setupConstrains()
        bind()
    }
    
    private func bind() {
        
        viewModel.fetchGoals()
            .map { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] goals in
                self.cells = goals
                tableView.reloadData()
            }.store(in: &cancellable)
        
    }
    
    private func setupViews() {
        view.backgroundColor = .darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BudgetTableViewCell.self, forCellReuseIdentifier: BudgetTableViewCell.cellID)
        
        view.subviews {
            tableView
        }
        
    }
    
    private func setupConstrains() {
        view.layout([
            180,
            tableView.left(10).right(10).bottom(0)
        ])
    }
    
}

extension BudgetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BudgetTableViewCell.cellID, for: indexPath) as? BudgetTableViewCell else {
            return UITableViewCell()
        }
        let goalItem = cells[indexPath.row]
        category.send(goalItem.type.name)
        cell.cellConfigure(model: goalItem)
        cell.progressBar.changeTintColorProgressView()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width / 2, height: 30))
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 1, width: view.frame.size.width / 2, height: 30)
        label.text = "Notification"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .whiteColor
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
}

