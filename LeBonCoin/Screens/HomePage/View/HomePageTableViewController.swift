//
//  HomePageTableViewController.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import UIKit

class HomePageTableViewController: UITableViewController {
    
    var filterTabButton: UIBarButtonItem?
    
    let rowHeight: CGFloat = 150
    var viewModel: HomePageVM
    
    var items: [Item] = []
    
    init() {
        let service = HomePageService(apiManager: ApiManager())
        self.viewModel = HomePageVM(homePageService: service)
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        getItems()
    
    }
    
    func getItems() {
        self.viewModel.getItems()
    }
    
    
    func setupView() {
        let leftButton = UIButton()
        leftButton.addTarget(self, action: #selector(filterClickListner), for: .touchUpInside)
        leftButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        leftButton.tintColor = .red
        filterTabButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = filterTabButton
        
        
        self.tableView.register(HomePageTableViewCell.self, forCellReuseIdentifier: HomePageTableViewCell.reuseIdentifier)
        self.tableView.separatorStyle = .none
        
    }
    
    func setupViewModel() {
        self.viewModel.itemCompletion = { [weak self]  (items) in
            DispatchQueue.main.async {
                self?.items = items
                self?.tableView.reloadData()
            }
            
        }
    }
    
    @objc func filterClickListner(_ sender: Any) {
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.reuseIdentifier, for: indexPath) as! HomePageTableViewCell
        
        // Configure the cell...
        let item = items[indexPath.row]
        cell.categorylabel.text = item.getTitle()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeight
    }

    
   

}
