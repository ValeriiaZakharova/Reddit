//
//  PostsResult.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 01.09.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import Foundation

struct PostsResult: Decodable {
    var data: Data
}

extension PostsResult {
    struct Data: Decodable {
        var children: [Child]
    }
}

extension PostsResult.Data {
    struct Child: Decodable {
        var data: PostModel
    }
}
