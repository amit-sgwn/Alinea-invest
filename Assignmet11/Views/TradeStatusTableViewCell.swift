//
//  TradeStatusTableViewCell.swift
//  Assignmet11
//
//  Created by Amit Kumar on 15/11/20.
//

import UIKit

class TradeStatusTableViewCell: UITableViewCell {

    static var reuseIdentifier: String = "TradeStatusTableViewCell"
   
    //MARK: Properties
    var cellimageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: "1")
        return imageview
    }()
    
    var heading: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "MediFest"
        return label
    }()
    
    var subTitle: UILabel = {
        let sub = UILabel()
        sub.translatesAutoresizingMaskIntoConstraints = false
        sub.font = UIFont(name: "Montserrat-Bold", size: 14)

        sub.textColor = .lightGray
        sub.text = "MEDI"
        return sub
    }()
    
    var containerStackView: UIStackView!
    var labelStackView: UIStackView!
    
    var gainerButton: UIButton = {
        var view =  UIView()
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("+50.0%", for: .normal)
        button.backgroundColor = UIColor(red: 114/255.0, green: 216/255.0, blue: 182/255, alpha: 1.0)
        
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addImageView()
        addLabels()
        addTradeStatus()
    }
    
    func addImageView() {
        self.addSubview(cellimageView)
        cellimageView.translatesAutoresizingMaskIntoConstraints = false
        cellimageView.clipsToBounds = false
        let leadingConstraint = NSLayoutConstraint(item: cellimageView, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 20)
        cellimageView.layer.cornerRadius = 20
        let topConstraint = NSLayoutConstraint(item: cellimageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: cellimageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let width = NSLayoutConstraint(item: cellimageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        self.addConstraints([leadingConstraint,topConstraint, width, height])
    }
    
    func addLabels() {
        labelStackView = UIStackView(arrangedSubviews: [heading,subTitle])
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillProportionally
        labelStackView.alignment = .leading
        labelStackView.spacing = 1.0
        self.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        guard let labelStackView = labelStackView else {
            return
        }
        
        let leadingConstraint = NSLayoutConstraint(item: labelStackView, attribute: .leading, relatedBy: .equal, toItem: cellimageView, attribute: .trailing, multiplier: 1, constant: 20)
    
        let topConstraint = NSLayoutConstraint(item: labelStackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
      
        let bottom = NSLayoutConstraint(item: labelStackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -20)
    
        self.addConstraints([leadingConstraint, topConstraint, bottom])
    }
    
    func addTradeStatus() {
        gainerButton.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSAttributedString(string: "+10.2%", attributes: [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.white])
        gainerButton.setAttributedTitle(attributedText, for: .normal)
        self.addSubview(gainerButton)
        gainerButton.translatesAutoresizingMaskIntoConstraints = false
        let trailingConstraint = NSLayoutConstraint(item: gainerButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -20)
    
        let equalCenter = NSLayoutConstraint(item: gainerButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: gainerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 20)
        let widthConstraint = NSLayoutConstraint(item: gainerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        self.addConstraints([trailingConstraint, equalCenter,height, widthConstraint])
    }
    
    func addConstraint() {
        self.addSubview(containerStackView)
        
        guard let containerStackView = containerStackView else { return }
        
        let leadingConstraint = NSLayoutConstraint(item: containerStackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: containerStackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -20)
        let topConstraint = NSLayoutConstraint(item: containerStackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
        let bottomConstraint = NSLayoutConstraint(item: containerStackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -20)
    
        self.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        
    }
    
    func setCellData(image: String, heading: String, subtitle: String, gain: String, status: Bool){
        self.cellimageView.image = UIImage(named: image)
        self.heading.text = heading
        self.subTitle.text = subtitle
        
        let attributedText = NSAttributedString(string: gain, attributes: [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.white])
        gainerButton.setAttributedTitle(attributedText, for: .normal)
        gainerButton.isEnabled = false
        if !status {
            gainerButton.backgroundColor = UIColor(red: 235.0/255, green: 115.0/255, blue: 112.0/255, alpha: 1)

        }
    }
    
}
