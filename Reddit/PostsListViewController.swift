//
//  ViewController.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 21.07.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import UIKit

class PostsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: Constants.cellIndetifier, bundle: nil), forCellReuseIdentifier: Constants.cellIndetifier)
    }
    
    


}

extension PostsListViewController {
    enum Constants {
        static let cellIndetifier = "PostCell"
    }
}
