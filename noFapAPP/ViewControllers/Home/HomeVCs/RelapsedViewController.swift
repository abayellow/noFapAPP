import UIKit

class RelapsedViewController: UIViewController {
    
    private lazy var tableView = configureTableView()
    private let relapsedLabel = UILabel(titel: "Relapsed", size: 40)
    private let setGoalButton = UIButton(titel: "Set new goal!", backGroundIMG: "1")
    private let tableData = [
    "Think about the reason why you failed. Never make the mistaike again. Just learn from it.",
    "Stay calm and come back stronder!",
    "if it does no challenge you. it does not change you",
    "Set yourself a new goal right away!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureConstraints()
    }
    
    private func configureTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.isScrollEnabled = false
        return tableView
    }
    
    private func configureConstraints() {
        [relapsedLabel, tableView, setGoalButton].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        
        NSLayoutConstraint.activate([
            relapsedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            relapsedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: relapsedLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: setGoalButton.topAnchor, constant: -20),
            
            setGoalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setGoalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            setGoalButton.heightAnchor.constraint(equalToConstant: 50),
            setGoalButton.widthAnchor.constraint(equalToConstant: 280)
        
        ])
        
    }
    
}

extension RelapsedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tableData[indexPath.row]
        content.textProperties.color = .white
        cell.contentConfiguration = content
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}
