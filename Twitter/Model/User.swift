//
//  User.swift
//  Twitter
//
//  Created by Hamish Johnson on 2018-03-05.
//  Copyright © 2018 Hamish Johnson. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bioText: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
    }
}
