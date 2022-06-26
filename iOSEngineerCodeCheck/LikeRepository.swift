//
//  LikeRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/27.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import RealmSwift

class LikeRepository: Object {
    
    @objc dynamic var fullName: String?
    @objc dynamic var language: String?
    @objc dynamic var stargazersCount: Int = 0
    @objc dynamic var watchersCount: Int = 0
    @objc dynamic var forksCount: Int = 0
    @objc dynamic var issuesCount: Int = 0
    @objc dynamic var ownerImageData: Data?
    
    
}
