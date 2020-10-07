//
//  PostsResult.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 01.09.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import Foundation

struct PostsResult: Decodable {
    var data: DataD
}

struct DataD: Decodable {
    var children: [Child]
}

struct Child: Decodable {
    var data: PostModel
}
