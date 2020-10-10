//
//  UserResult.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 08.10.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import Foundation

struct UserResult: Decodable {
    var data: UserData
}

struct UserData: Decodable {
    var subreddit: SubredditModel
}

struct SubredditModel: Decodable {
    var communityIcon: String?
    var iconImage: String
    
    enum CodingKeys: String, CodingKey {
        case communityIcon = "community_icon"
        case iconImage = "icon_img"
    }
}


