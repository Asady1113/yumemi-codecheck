//
//  Owner.swift
//  iOSEngineerCodeCheck
//
//  Created by 浅田智哉 on 2022/06/24.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

struct Owner {
    
    let avatorUrl: String
    
    init(json: [String: Any]) {
        avatorUrl = json["avatar_url"] as? String ?? ""
    }
    
}

