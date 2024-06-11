import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Methods
    /// Set view controllers to tabBar
    private func configureTabBar() {
        
        // Seting tabBar aperiance
        tabBar.backgroundColor = #colorLiteral(red: 0.0901960656, green: 0.0901960656, blue: 0.0901960656, alpha: 1)             // tabBar backgroundColor
        tabBar.tintColor = .white                     // Selected tabBar color
        tabBar.unselectedItemTintColor =  .lightGray  // Unselected tab color
        
        // Adding view controllers to tabBar.
        self.viewControllers = [
        configureVC(vc: HomeViewController(), title: "Home", image: UIImage(systemName: "house")),
        configureVC(vc: ProgressViewController(), title: "Progress", image: UIImage(systemName: "circle")),
        configureVC(vc: HistoryViewController(), title: "History", image: UIImage(systemName: "timer")),
        configureVC(vc: SettingViewController(), title: "Setting", image: UIImage(systemName: "gear"))
        ]
    }
    
    
    /// Configure view controllers
    /// - Parameters:
    ///   - vc: view controller to config
    ///   - title: tabBar title
    ///   - image: tabBar image
    /// - Returns: Configurated view controller
    private func configureVC(vc: UIViewController, title: String, image: UIImage?) -> UIViewController {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
    
}
