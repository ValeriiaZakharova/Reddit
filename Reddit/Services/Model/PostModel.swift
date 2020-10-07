//
//  PostModel.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 01.09.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import Foundation

struct PostModel: Codable {
    let id: String
    let title: String
    let author: String
    let thumbnail: URL
}
