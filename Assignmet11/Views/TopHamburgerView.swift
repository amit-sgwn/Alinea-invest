//
//  TopHamburgerView.swift
//  Assignmet11
//
//  Created by Amit Kumar on 15/11/20.
//

import UIKit

class TopHamburgerView: UIView {

 //   var hamburgerView: UIStackView?
    var topView: UIStackView!
    
    //MARK: Init
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupView()
     }
     
     //initWithCode to init view from xib or storyboard
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setupView()
     }
     
     //MARK: SetUp Fucntions
     private func setupView() {
        createView()
     }
    
    func createView() {
        let hamBurger = UIImageView(image: UIImage(named: "hamburger"))
        hamBurger.contentMode = .scaleAspectFit
        let font = UIFont(name: "Montserrat-Bold", size: 15)
        let label = UILabel()
        label.font = font
        label.text = "Explore"
        let imageView = UIImageView(image: UIImage(named: "noti"))
       
        topView = UIStackView(arrangedSubviews: [hamBurger, label,imageView])
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.axis = .horizontal
        topView.distribution = .equalCentering
        topView.alignment = .leading
        topView.spacing = 3
        self.addSubview(topView)
        
        guard let topView = topView else {
            return
        }
        let leadingConstraint = NSLayoutConstraint(item: topView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: topView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: topView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: topView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        topView.frame = self.bounds
        
        self.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])

    }
}
