//
//  HomeDataSourceController+navbar.swift
//  Twitter
//
//  Created by Hamish Johnson on 2018-03-06.
//  Copyright © 2018 Hamish Johnson. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    func setupNavigationBarItems() {
        setupNavTitle()
        setupLeftNavItem()
        setupRightNavItems()
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupNavTitle() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
    }
    
    private func setupLeftNavItem() {
        let leftButton = UIButton(type: .system)
        leftButton.setImage(#imageLiteral(resourceName: "profile").withRenderingMode(.alwaysOriginal), for: .normal)
        leftButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "profile").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "profile").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton),UIBarButtonItem(customView: searchButton)]
    }
}
