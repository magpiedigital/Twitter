//
//  Tweet.swift
//  Twitter
//
//  Created by Hamish Johnson on 2018-03-06.
//  Copyright © 2018 Hamish Johnson. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJSON = json["user"]
        self.user = User(json: userJSON)
        self.message = json["message"].stringValue
    }
}
