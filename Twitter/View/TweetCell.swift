//
//  TweetCell.swift
//  Twitter
//
//  Created by Hamish Johnson on 2018-03-06.
//  Copyright © 2018 Hamish Johnson. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
}
