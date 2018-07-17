//
//  DataAccess.swift
//  MVVM architecture sample
//
//  Created by Vansa Pha on 7/17/18.
//  Copyright © 2018 KOSIGN. All rights reserved.
//

import Foundation

class DataAccess {
    
    typealias completionHandler = (_ data: [UserModel]?, _ error: NSError?)-> ()
    static let manager = DataAccess()
    private init(){}
    
    func fetchData(completion: @escaping completionHandler) {
        guard let countryJsonPath = Bundle.main.path(forResource: "UserJsonList", ofType: "json") else {
            let jsonNotFoundError = NSError(domain: "client error", code: 404, userInfo: [NSLocalizedDescriptionKey: "JSON file not found!"])
            return completion(nil, jsonNotFoundError)
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: countryJsonPath), options: .mappedIfSafe)
            let response = try JSONDecoder().decode([UserModel].self, from: data)
            completion(response, nil)
        }catch let err as NSError {
            completion(nil, err)
        }
    }
    
}
