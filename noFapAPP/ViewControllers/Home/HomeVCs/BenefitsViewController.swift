import UIKit

class BenefitsViewController: UIViewController {
    
    private lazy var tableView = configureTableView()
    private let benefitLabel = UILabel(titel: "BENEFITS", size: 50)
    
    private var tableData = [
    "Increased happiness",
    "Boosted confidence",
    "Endless motivation and Willpower",
    "Self Control becomes stronger",
    "Increased Optimism",
    "Improved attitude and appreciation toward the opposid of sex",
    "Increasd testesterone level",
    "Do better in Gym",
    "Woman Start to notice you more",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setConstraints()
    }
    
 
    
    private func configureTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        tableView.layer.cornerRadius = 12
        tableView.clipsToBounds = true
        tableView.isScrollEnabled = false
        return tableView
    }
    
    private func setConstraints() {
        [tableView, benefitLabel].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
     
        
        let cellHeight: CGFloat = 47 // Высота одной ячейки (можете заменить на фактическую высоту ячейки)
        let tableViewHeight = cellHeight * CGFloat(tableData.count) // Вычисляем высоту таблицы
        
        NSLayoutConstraint.activate([
            benefitLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            benefitLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            benefitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: benefitLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.heightAnchor.constraint(equalToConstant: tableViewHeight)
        ])
       
    }
    

}

extension BenefitsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tableData[indexPath.row]
        content.textProperties.color = .white
        cell.contentConfiguration = content
//        cell.layer.cornerRadius = 12
        cell.backgroundColor = #colorLiteral(red: 0.1098035946, green: 0.1098040119, blue: 0.1176466122, alpha: 1)
        cell.selectionStyle = .none

        return cell
    }
    

    
}
