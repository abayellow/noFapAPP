import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties.
    private let benefitsButton = UIButton(titel: "Benefits", backGroundIMG: "1")
    private let timelineButton = UIButton(titel: "Timeline", backGroundIMG: "5")
    private let relapsedButton = UIButton(titel: "Relapsed?", backGroundIMG: "3")
    private let urgeButton = UIButton(titel: "Feeling an urge?", backGroundIMG: "2")
    private let bestButton = UIButton(titel: "BEST 0 days STREAKS 0 times", backGroundIMG: "5")
    

    // MARK: - Lifecycle method.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setConstraints()
        configureNavigationController()
        configureButton()
    }
    
   
    // MARK: - Methods.
    private func configureNavigationController() {
        navigationItem.title = "StopFap"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    private func configureButton() {
        [benefitsButton, timelineButton, relapsedButton, urgeButton].forEach { button in
            button.addTarget(self, action: #selector(goToBenefitsVC), for: .touchUpInside)
        }
    }
    
    @objc private func goToBenefitsVC(sender: UIButton) {
        var pushedVC = UIViewController()
        
        switch sender.tag {
        case 0: pushedVC = BenefitsViewController()
        case 1: pushedVC = TimelineViewController()
        case 2: pushedVC = RelapsedViewController()
        case 3: pushedVC = UrgeViewController()
        default: break
        }
        
        navigationController?.pushViewController(pushedVC, animated: true)
    }
  
    // MARK: - Constraints.
    private func setConstraints() {
        
        [benefitsButton, timelineButton, relapsedButton, urgeButton, bestButton].enumerated().forEach {index, value in
            value.tag = index
            value.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(value)
        }
    
        NSLayoutConstraint.activate([
            benefitsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            benefitsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            benefitsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            benefitsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            benefitsButton.heightAnchor.constraint(equalToConstant: 60),
            
            timelineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timelineButton.topAnchor.constraint(equalTo: benefitsButton.bottomAnchor, constant: 10),
            timelineButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timelineButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timelineButton.heightAnchor.constraint(equalToConstant: 60),
            
            relapsedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            relapsedButton.topAnchor.constraint(equalTo: timelineButton.bottomAnchor, constant: 25),
            relapsedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            relapsedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            relapsedButton.heightAnchor.constraint(equalToConstant: 60),
            
            urgeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            urgeButton.topAnchor.constraint(equalTo: relapsedButton.bottomAnchor, constant: 10),
            urgeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            urgeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            urgeButton.heightAnchor.constraint(equalToConstant: 60),
            
            bestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bestButton.topAnchor.constraint(equalTo: urgeButton.bottomAnchor, constant: 30),
            bestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            bestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            bestButton.heightAnchor.constraint(equalToConstant: 160),
            
        ])
        
    }
    
}

