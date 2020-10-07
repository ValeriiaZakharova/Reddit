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
    
    var service: PostsService = PostsServiceImpl()
    
    var posts: [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.register(UINib(nibName: Constants.cellIndetifier, bundle: nil), forCellReuseIdentifier: Constants.cellIndetifier)
        
        getPosts()
    }
   
    //MARK: - Private
    
    private func getPosts() {
        service.fetchPosts { [weak self] (posts, error) in
            guard let self = self else { return }
            if let error = error {
                self.showError(error.localizedDescription)
                print(error)
            } else {
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }
    
    func showError(_ error: String) {
        let alertController = UIAlertController()
        alertController.message = error
        alertController.addAction(.init(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
    
}

  //MARK: - UITableViewDataSourse

extension PostsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIndetifier) as! PostCell
        let post = posts[indexPath.row]
        cell.authorLabel.text = post.author
        cell.groupnameLabel.text = post.subreddit
        cell.commentsCountLabel.text = String(post.comentsAmount) //= (post.comentsAmount.flatMap {String($0)} ) ?? ""
        cell.likeCountLabel.text = String(post.score)//= post.score.flatMap({ (score) -> String in
            //String(score)
        //}) ?? ""
        cell.titleLabel.text = post.title
        
        if let url = URL(string: post.thumbnail) {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.contentImageView.image = image
                    }
                } catch {
                    print(error)
                }
            }
        }
        
        return cell
    }
}

extension PostsListViewController {
    enum Constants {
        static let cellIndetifier = "PostCell"
    }
}
