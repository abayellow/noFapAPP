import UIKit

extension UILabel {
    convenience init(titel: String, size: Int) {
        self.init(frame: .zero)
        self.text = titel
        self.font = .systemFont(ofSize: CGFloat(size), weight: .black)
        self.textColor = .white
        
    }
}

extension UIButton {
    convenience init(titel: String, backGroundIMG: String) {
        self.init(frame: .zero)
        self.setTitle(titel, for: .normal)
        self.setBackgroundImage(UIImage(named: backGroundIMG), for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
//        self.contentHorizontalAlignment = .left
//        self.titleEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

extension UIButton {
    convenience init(title: String, fontSize: Int) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: CGFloat(fontSize))
    }
}
