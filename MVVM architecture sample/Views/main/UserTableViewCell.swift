//
//  UserTableViewCell.swift
//  MVVM architecture sample
//
//  Created by Vansa Pha on 7/17/18.
//  Copyright © 2018 KOSIGN. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLb: UILabel!
    @IBOutlet weak var genderLb: UILabel!
    
    func config(model: UserModel) {
        userNameLb.text = model.NAME
        genderLb.text = (model.GENDER == 0) ? "male" : "female"
    }
    
}
