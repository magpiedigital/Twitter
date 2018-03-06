//
//  HomeDataSource.swift
//  Twitter
//
//  Created by Hamish Johnson on 2018-03-05.
//  Copyright © 2018 Hamish Johnson. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let user1 = User(name: "Hamish Johnson", username: "@hamishjohnson", bioText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in volutpat nulla. Donec non nisl sit amet justo placerat pellentesque eleifend vel mauris.")
        let user2 = User(name: "Other Name", username: "@othername", bioText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in volutpat nulla. Donec non nisl sit amet justo placerat pellentesque eleifend vel mauris.")
        let user3 = User(name: "Another Name", username: "@anothername", bioText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in volutpat nulla. Donec non nisl sit amet justo placerat pellentesque eleifend vel mauris.")
        
        return [user1, user2, user3]
    }()
    
    let tweets = ["Tweet1", "Tweet2"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
}
