//
//  TradingCell.swift
//  Assignmet11
//
//  Created by Amit Kumar on 15/11/20.
//

import UIKit

class TradingCell: UITableViewCell {

    var stockImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var label: UILabel!
    static var reuseIdentifier: String = "TradingCell"
    
    //MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: SetUp
    func setUpView() {
        addBackGroundcolor()
        addImageView()
        addLabel()
    }

    private func addImageView() {
        
        self.addSubview(stockImageView)
        stockImageView.translatesAutoresizingMaskIntoConstraints = false
        stockImageView.image = UIImage(named: "hamburger")
        stockImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       
        let leadingConstraint = NSLayoutConstraint(item: stockImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 40)
        let equalCnters = NSLayoutConstraint(item: stockImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: stockImageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let heightConstraint = NSLayoutConstraint(item: stockImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        self.addConstraints([leadingConstraint, heightConstraint, widthConstraint, equalCnters])
    }
    
    private func addLabel() {
        label = UILabel(frame: .zero)
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "Hello"
        
        guard let label = label else { return }
        
        let leadingConstraint1 = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: stockImageView, attribute: .trailing, multiplier: 1, constant: 20)
        let topConstraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 30)
        let heightConstraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25)
      
        self.addConstraints([leadingConstraint1, heightConstraint, topConstraint])
        NSLayoutConstraint.activate([leadingConstraint1, heightConstraint, topConstraint])

    }
    
    func addBackGroundcolor() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 35
        view.backgroundColor = .yellow
       
        self.addSubview(view)
        let leadingConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10)
        let trailingConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -20)
        let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        let botomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10)
        self.addConstraints([leadingConstraint, trailingConstraint, botomConstraint, topConstraint])
    }
    
    
    public func setCellData(imageThumnail: String, cellLabel: String){
        self.stockImageView.image = UIImage(named: imageThumnail)
        self.label.text = cellLabel
        
    }

}
