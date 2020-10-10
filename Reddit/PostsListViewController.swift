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
    var userService: UserService = UserServiceImp()
    
    var posts: [PostModel] = []
    var users: [SubredditModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: Constants.cellIndetifier, bundle: nil), forCellReuseIdentifier: Constants.cellIndetifier)
        tableView.rowHeight = UITableView.automaticDimension
        getPosts()
        //        getUsers()
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
    
    //    private func getUsers() {
    //        userService.getUser { [weak self] (users, error) in
    //            guard let self = self else {return}
    //            if let error = error {
    //                self.showError(error.localizedDescription)
    //                print(error)
    //            } else {
    //                self.users = users
    //                self.tableView.reloadData()
    //            }
    //        }
    //    }
    private func showError(_ error: String) {
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
        cell.delegate = self
        let post = posts[indexPath.row]
        //        let user = users[indexPath.row]
        cell.authorLabel.text = post.author
        cell.groupnameLabel.text = post.subreddit
        cell.scoreButton.setTitle(String(post.score), for: .normal)
        cell.commentsButton.setTitle(String(post.comentsAmount), for: .normal)
        cell.titleLabel.text = post.title
        
        if let url = URL(string: post.url) {
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
        
        //        if let url = URL(string:  {
        //            DispatchQueue.global().async {
        //                do {
        //                    let data = try Data(contentsOf: url)
        //                    let image = UIImage(data: data)
        //                    DispatchQueue.main.async {
        //                        cell.userAvatarImageView.image = image
        //                    }
        //                } catch {
        //                    print(error)
        //                }
        //            }
        //        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension PostsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - PostCellDelegate

extension PostsListViewController: PostCellDelegate {
    
    func commentsTapped(cell: PostCell, button: UIButton) {}
    
    func getFullPic(cell: PostCell) {}
    
    func awardTapped(cell: PostCell) {}
    
    func shareTapped(cell: PostCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let post = posts[indexPath.row]
        let items = [post.url]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    func scoreTapped(cell: PostCell) {
        cell.scoreButton.tintColor = .blue
        
    }
}

extension PostsListViewController {
    enum Constants {
        static let cellIndetifier = "PostCell"
    }
}
