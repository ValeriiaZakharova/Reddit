//
//  PostModel.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 01.09.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import Foundation

struct PostModel: Decodable {
    let subreddit: String
    let author: String
    let score: Int
    let title: String
    let comentsAmount: Int
    let thumbnail: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case subreddit
        case author
        case score
        case title
        case comentsAmount = "num_comments"
        case thumbnail
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decode(String.self, forKey: .author)
        comentsAmount = try container.decode(Int.self, forKey: .comentsAmount)
        subreddit = try container.decode(String.self, forKey: .subreddit)
        score = try container.decode(Int.self, forKey: .score)
        title = try container.decode(String.self, forKey: .title)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        url = try container.decode(String.self, forKey: .url)
    }
}
