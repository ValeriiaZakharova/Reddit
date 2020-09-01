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

  //MARK: - UITableViewDataSourse

extension PostsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIndetifier) as! PostCell
        
        return cell
    }
}

extension PostsListViewController {
    enum Constants {
        static let cellIndetifier = "PostCell"
    }
}
