//
//  PostsService.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 07.09.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import Foundation

protocol PostsService {
    func fetchPosts(completion: @escaping ([PostModel], Error?) -> Void)
}

final class PostsServiceImpl: PostsService {
    
    func fetchPosts(completion: @escaping ([PostModel], Error?) -> Void) {
        
        guard let url = URL(string: "https://www.reddit.com/top") else {return}
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion([], error)
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PostsResult.self, from: data)
                DispatchQueue.main.async {
                    completion(result.data.children.map({ (post) -> PostModel in
                        post.data
                    }), nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion([], error)
                }
            }
        }.resume()
    }
}






