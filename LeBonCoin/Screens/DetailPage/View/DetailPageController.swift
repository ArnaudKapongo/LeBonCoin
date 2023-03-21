//
//  DetailPageController.swift
//  LeBonCoin
//
//  Created by Younup on 21/03/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var viewModel: HomePageVM
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.clipsToBounds = true
        return label
    }()
    
    let dateLabel : UILabel = {
       let label = UILabel()
       label.textColor = .darkGray
       label.font = UIFont.systemFont(ofSize: 12)
       label.textAlignment = .right
       label.numberOfLines = 0
       return label
   }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
   let imageItem : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = cornerSize
        return imgView
    }()

    let urgentImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named:""))
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
