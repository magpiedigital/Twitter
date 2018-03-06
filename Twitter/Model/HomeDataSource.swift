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
    
    let tweets: [Tweet] = {
        let user1 = User(name: "Hamish Johnson", username: "@hamishjohnson", bioText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in volutpat nulla. Donec non nisl sit amet justo placerat pellentesque eleifend vel mauris.")
        
        let tweet = Tweet(user: user1, message: "Welcome to episode 9 of the twitter series. Really hope you guys are enjoying this series so far. I really really need a long text bock to render out. So we're going to stop here.")
        let tweet2 = Tweet(user: user1, message: "This is the second tweet message for our sample project. Very very exciting...")
        
        return [tweet, tweet2]
    }()
    
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
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
}
