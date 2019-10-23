//
//  UserViewModel.swift
//  Desafio
//
//  Created by Pedro Alcaide on 21/10/2019.
//  Copyright © 2019 Pedro Alcaide. All rights reserved.
//

import Foundation

public struct GHItem {
    var fullName: String
    var login: String
    var avatarUrl: String
    var starsCount: Int
}

public extension GHItem {
    init?(json: [String: Any]) {
        guard   let fullName = json["full_name"] as? String,
            let starsCount = json["stargazers_count"] as? Int,
            let owner = json["owner"] as? [String: Any],
            let login = owner["login"] as? String,
            let avatarUrl = owner["avatar_url"] as? String
            else {
                return nil
        }
        self.fullName = fullName
        self.login = login
        self.avatarUrl = avatarUrl
        self.starsCount = starsCount
    }
}
