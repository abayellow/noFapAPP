import UIKit

class UrgeViewController: UIViewController {
    
    private let label = UILabel(titel: "If you feel an urge", size: 40)
    private lazy var tabelView = configureTable()
    
    private var tableData = [
        "Immediately distrsact yourself and do something else.",
        "Do as many pushups as you can.",
        "Dring water.",
        "Surround yourself with people.",
        "Use the urge Counter. Click here"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setConstraints()
    }
    
    private func configureTable() -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.isScrollEnabled = false
        return tableView
    }
    
    private func setConstraints() {
        [label, tabelView].forEach() {item in
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tabelView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            tabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        
        ])
        
    }
    
    
}

extension UrgeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = tableData[indexPath.row]
        configuration.textProperties.color = .white
        cell.contentConfiguration = configuration
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        return cell
    }
    
    
}
