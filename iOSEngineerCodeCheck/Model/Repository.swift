//
//  Repository.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/24.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

struct Repository {
    
    let fullName: String
    let language: String
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let issuesCount: Int
    let owner: Owner
    
    
    init(json: [String: Any]) {
        
        fullName = json["full_name"] as? String ?? ""
        language = json["language"] as? String ?? ""
        stargazersCount = json["stargazers_count"] as? Int ?? 0
        watchersCount = json["wachers_count"] as? Int ?? 0
        forksCount = json["forks_count"] as? Int ?? 0
        issuesCount = json["open_issues_count"] as? Int ?? 0
        owner = Owner(json: (json["owner"] as? [String : Any] ?? [:]))
    }
    
    
}

