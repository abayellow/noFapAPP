import UIKit

class TimelineViewController: UIViewController {
    
    private lazy var tableView = configureTableView()
    let sections = ["FIRST DAYS", "DAY4 - 1 WEEK", "1WEEK - 2 WEEK", "2 WEEK - 1 MONTH", "1 MONTH - 6 MONTHS A..."]
       let items = [
           ["Fighting against StopFap", "Blue Balls"],
           ["Increased energy", "Better sleep", "Happier", "Less tired", "Self-esteem boost"],
           ["More motivated", "Increased confidence", "Alpha Male  signs", "Increased gym strenght", "High Testesteron Level"],
           ["Female attention increases", "Maximum energy", "Deeper voice", "Smarter", "Love for life", "Alpha Male signs still increasing", "Better focus", "Improved skin"],
           ["Brain resets during this period", "Better sexual performance", "Learn to live with the benefits", "StopFap becomes a lifestyle"]
       ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setConstraints()
        configureNavController()
    }
    
 
    
    private func configureTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.1098035946, green: 0.1098040119, blue: 0.1176466122, alpha: 1)
        tableView.layer.cornerRadius = 20
        tableView.layer.masksToBounds = true
//        tableView.isScrollEnabled = false
        return tableView
    }
    
    private func configureNavController() {
        // Установить фон для навигационного контроллера
              navigationController?.navigationBar.barTintColor = .black
              navigationController?.navigationBar.isTranslucent = false
              navigationController?.view.backgroundColor = .black
    }
    
    private func setConstraints() {
        [tableView].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
      
        
        NSLayoutConstraint.activate([
     
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
       
    }
    

}

extension TimelineViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
//        content.text = tableData[indexPath.row]
        content.text =  items[indexPath.section][indexPath.row]
        content.textProperties.color = .white
        cell.contentConfiguration = content

        cell.backgroundColor = #colorLiteral(red: 0.1098035946, green: 0.1098040119, blue: 0.1176466122, alpha: 1)
        cell.selectionStyle = .none

        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "One"
//        case 1: return "Two"
//        case 2: return "Three"
//        default: return nil
//        }
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
              headerView.backgroundColor = .black

              let label = UILabel()
              label.translatesAutoresizingMaskIntoConstraints = false
              label.textColor = .white
              label.font = UIFont.boldSystemFont(ofSize: 24)
              label.text = sections[section]
              headerView.addSubview(label)

              NSLayoutConstraint.activate([
                  label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                  label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
              ])

              return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
   
    
}
