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
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    
    override func prepareForReuse() {
        self.categorylabel.text = ""
    }
    
    func setupView() {
        self.categorylabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.categorylabel)
        ConstraintManager.centerVertically(view: categorylabel, parentView: self.contentView)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
