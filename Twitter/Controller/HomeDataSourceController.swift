//
//  HomeDataSourceController.swift
//  Twitter
//
//  Created by Hamish Johnson on 2018-03-05.
//  Copyright © 2018 Hamish Johnson. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
        fetchHomeFeed()
        
//        self.datasource = HomeDataSource()
    }
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class Home: JSONDecodable {
        
        required init(json: JSON) throws {
            print("Now ready to parse JSON \n", json)
            
            var users = [User]()
            
            let array = json["users"].array
            for user in array! {
                let name = user["name"].stringValue
                let username = user["userName"].stringValue
                let bio = user["bio"].stringValue
                
                let user = User(name: name, username: username, bioText: bio)
                users.append(user)
            }
                        
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
    
    private func fetchHomeFeed() {
        let request: APIRequest<HomeDataSource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (home) in
            print("Successfully fetched")
            
            self.datasource = home
        }) { (error) in
            print("Error: ", error)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = datasource?.item(indexPath) as? User {

            let size = CGSize(width: view.frame.width-12-50-8-12, height: 9999)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
}
