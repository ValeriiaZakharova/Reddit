//
//  UserService.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 09.10.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import Foundation

protocol UserService {
    func getUser(completion: @escaping ([SubredditModel], Error?) -> Void)
}

final class UserServiceImp: UserService {
    
    func getUser(completion: @escaping ([SubredditModel], Error?) -> Void) {
        guard let url = URL(string: "https://www.reddit.com/user/spez/about.json") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let response = response {
                print(response)
            }
        
            guard let data = data else {
                DispatchQueue.main.async {
                    completion( [], error)
                }
                return
            }
            
            //let jsonInfo = String(data: data, encoding: .utf8)
            
            do {
                let result = try JSONDecoder().decode(UserResult.self, from: data)
                print(result)
                
                DispatchQueue.main.async {
                    completion([result.data.subreddit], nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion([], error)
                }
            }
        }.resume()
    }
    
    
}
