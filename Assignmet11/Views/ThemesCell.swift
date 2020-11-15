//
//  ThemesCell.swift
//  Assignmet11
//
//  Created by Amit Kumar on 15/11/20.
//

import UIKit

class ThemesCell: UICollectionViewCell {
    static let cellId = "ThemesCell"
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = UIColor.systemGray
        
        return label
    }()
    
    var stackView: UIStackView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews(){
        self.backgroundColor = UIColor(red: 250/255.0, green: 251/255.0, blue: 252.0/255, alpha: 1.0)
        stackView = UIStackView(arrangedSubviews: [imageView,label])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        self.layer.borderColor =  UIColor(red: 242/255.0, green: 244/255.0, blue: 250.0/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 0.5
        self.addSubview(stackView)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4
        guard let stackView = stackView else { return }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10)
        let trailingConstraint = NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -10)
        let topConstraint = NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        let bottomConstraint = NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10)
    
        self.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        
        imageView.image = UIImage(named: "hamburger")
        label.text = "Hello"
    }
    
    func setData(image: String, label: String){
        self.label.text = label
        imageView.image = UIImage(named: image)
    }
}
