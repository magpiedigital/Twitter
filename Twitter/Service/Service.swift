//
//  Service.swift
//  Twitter
//
//  Created by Hamish Johnson on 2018-03-07.
//  Copyright © 2018 Hamish Johnson. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource) -> ()) {
        let request: APIRequest<HomeDataSource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDataSource) in
            completion(homeDataSource)
        }) { (error) in
            print("Error: ", error)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
    
}
