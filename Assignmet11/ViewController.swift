//
//  ViewController.swift
//  Assignmet11
//
//  Created by Amit Kumar on 15/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    let segmentationControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Category","Themes", "Trending"])
        sc.selectedSegmentIndex = 0
        sc.layer.borderColor = UIColor(red: 0.0/255, green: 122/255.0, blue: 255/255.0, alpha: 1).cgColor
        sc.layer.borderWidth = 1
        return sc
    }()
    var topBanner: TopHamburgerView!
    
    //MARK: TestData
    var results = ["Stocks", "ETF", "Trading", "Options", "Futures"]
    var collections = ["Diversity and Inclusion", "Bold BioTech ", "Clean and Grean", "Crypto Central", "She runs it","Power It", "Foodie ", "Art faishon", "Health and Mind", "I am doing great"]
    
    var stocks = ["Slack", "Google", "Pinterset", "Instagram", "Facebook", "Apple", "Stripe", "Square"]
    
    var stocksdUBtitle = ["Tech", "Tech", "Social", "Photo", "Post", "Products", "Payment", "Payment"]
    
    var gains = ["+20.0%", "-10.0%", "+12.0%", "+21.0%","-20.0%", "-14.0%", "-12.5%", "+21.0%"]
    
    var status = [true, false, true, true, false, false , false, true ]
    
    
    var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    var collectionview: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentationControl.addTarget(self, action: #selector(ViewController.indexChanged(_:)), for: .valueChanged)
        self.view.backgroundColor = .white
        addHamBurger()
        addsegmentConstraint()
        addTableView()
        setTableView()
        setCollcetionView()
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(TradingCell.self, forCellReuseIdentifier: TradingCell.reuseIdentifier)
        tableView.register(TradeStatusTableViewCell.self, forCellReuseIdentifier: TradeStatusTableViewCell.reuseIdentifier)
        
    }
    
    func setCollcetionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(ThemesCell.self, forCellWithReuseIdentifier: ThemesCell.cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        self.view.addSubview(collectionview)
        
    }
    
    func addHamBurger() {
        topBanner = TopHamburgerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 30))
        self.view.addSubview(topBanner)
        topBanner.translatesAutoresizingMaskIntoConstraints = false
        
        guard let topBanner = topBanner else {
            return
        }
        
        let leadingConstraint = NSLayoutConstraint(item: topBanner, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: topBanner, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        let topConstraint = NSLayoutConstraint(item: topBanner, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: topBanner, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, heightConstraint])
        topBanner.layoutIfNeeded()
        
    }
    
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        if segmentationControl.selectedSegmentIndex == 0 {
            print("Select 0")
            tableView.isHidden = false
            collectionview.isHidden = true
            tableView.reloadData()
        } else if segmentationControl.selectedSegmentIndex == 1 {
            collectionview.frame = tableView.frame
            addCollectionViewConstraint()
            tableView.isHidden = true
            collectionview.isHidden = false
            collectionview.reloadData()
        } else if segmentationControl.selectedSegmentIndex == 2 {
            tableView.isHidden = false
            collectionview.isHidden = true
            tableView.reloadData()
        }
    }
    
    func addCollectionViewConstraint() {
        
        guard let collectionview = collectionview else { return }
        
        let leadingConstraint = NSLayoutConstraint(item: collectionview, attribute: .leading, relatedBy: .equal, toItem: segmentationControl, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: collectionview, attribute: .trailing, relatedBy: .equal, toItem: segmentationControl, attribute: .trailing, multiplier: 1, constant: 0)
        
        let topConstraints = NSLayoutConstraint(item: collectionview, attribute: .top, relatedBy: .equal, toItem: tableView, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: collectionview, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 10)
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraints, bottomConstraint])
    }
    
    
    func addsegmentConstraint() {
        self.view.addSubview(segmentationControl)
        segmentationControl.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: segmentationControl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: segmentationControl, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        let topConstraint = NSLayoutConstraint(item: segmentationControl, attribute: .top, relatedBy: .equal, toItem: topBanner, attribute: .bottom, multiplier: 1, constant: 20)
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraint])
        
    }
    
    func addTableView()  {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 10)
        let trailingConstraint = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -10)
        let topConstraint = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: segmentationControl, attribute: .bottom, multiplier: 1, constant: 20)
        let bottomConstraint = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 20)
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentationControl.selectedSegmentIndex {
        case 0:
            return results.count
        case 1:
            return 0
        case 2:
            return stocks.count
        default:
            return 12
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch segmentationControl.selectedSegmentIndex {
        case 0:
            return 1
        case 2:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.segmentationControl.selectedSegmentIndex {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: TradingCell.reuseIdentifier, for: indexPath) as! TradingCell
            cell.setCellData(imageThumnail: "\(indexPath.row)", cellLabel: results[indexPath.row])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TradeStatusTableViewCell.reuseIdentifier, for: indexPath) as! TradeStatusTableViewCell
            cell.setCellData(image: "\(indexPath.row)", heading: stocks[indexPath.row], subtitle: stocksdUBtitle[indexPath.row], gain: gains[indexPath.row], status: status[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TradeStatusTableViewCell.reuseIdentifier, for: indexPath) as! TradeStatusTableViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
        let uiview = UIView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
        uiview.addSubview(label)
        uiview.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        let leadingConstaint = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: uiview, attribute: .leading, multiplier: 1, constant: 20)
        let tralilingConstaint = NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: uiview, attribute: .trailing, multiplier: 1, constant: 0)
        
        let topConstaint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: uiview, attribute: .top, multiplier: 1, constant: 0)
        
        let bottomConstaint = NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: uiview, attribute: .bottom, multiplier: 1, constant: 0)
        uiview.addConstraints([leadingConstaint, tralilingConstaint, topConstaint, bottomConstaint])
        if section == 0 {
            label.text = "Top Gainer"
        } else {
            label.text = "Top Seller"
        }
        label.font = UIFont(name: "Montserrat-Bold", size: 18)!
        label.backgroundColor = UIColor(red: 238/255.0, green: 238.0/255, blue: 239255.0, alpha: 1)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch segmentationControl.selectedSegmentIndex {
        case 0:
            return 0
        case 2:
            return 40
        default:
            return 0
        }
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if segmentationControl.selectedSegmentIndex == 0 || segmentationControl.selectedSegmentIndex == 2 {
            return 0
        }
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: ThemesCell.cellId, for: indexPath) as! ThemesCell
        cell.setData(image: "\(indexPath.row)", label: collections[indexPath.row])
        return cell
    }
}
