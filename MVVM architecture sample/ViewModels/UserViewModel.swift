//
//  UserViewModel.swift
//  MVVM architecture sample
//
//  Created by Vansa Pha on 7/17/18.
//  Copyright © 2018 KOSIGN. All rights reserved.
//

import Foundation

class UserViewModel {
    
    var userInfoList: [UserModel]?
    
    func requestUserInformation(completion: @escaping (NSError?) -> Void) {
        DataAccess.manager.fetchData { (dataArr, error) in
            guard let errorStatus = error else {
                self.userInfoList = dataArr
                return completion(nil)
            }
            completion(errorStatus)
        }
    }
    
}
