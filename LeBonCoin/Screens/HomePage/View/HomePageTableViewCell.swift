//
//  HomePageTableViewCell.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {
    
    
    static var reuseIdentifier = "HomePageCell"
    
    let categorylabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel : UILabel = {
        let price = UILabel()
        price.textColor = .black
        price.font = UIFont.boldSystemFont(ofSize: 9)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textAlignment = .right
        price.numberOfLines = 0
        return price
    }()
    
    let imageItem : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
    }
    
    override func prepareForReuse() {
        self.categorylabel.text = ""
        self.priceLabel.text = ""
    }
    
    func setupView() {
        self.contentView.addSubview(self.categorylabel)
        self.contentView.addSubview(self.priceLabel)
       
    }
    
    func setupConstraint() {
        ConstraintManager.centerVertically(view: priceLabel, parentView: self.contentView)
       // ConstraintManager.setVerticalConstraint(topView: categorylabel, bottomView: imageItem, spacing: 10, parentView: self.contentView)
        //ConstraintManager.setVerticalConstraint(topView: categorylabel, bottomView: priceLabel, spacing: ConstraintManager.s, parentView: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
