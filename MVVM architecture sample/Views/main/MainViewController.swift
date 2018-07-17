//
//  ViewController.swift
//  MVVM architecture sample
//
//  Created by Vansa Pha on 7/17/18.
//  Copyright © 2018 KOSIGN. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //connnection
    @IBOutlet weak var userTableView: UITableView!
    
    //visual properties
    let userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestUserList()
    }
    
    private func configTableView() {
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
    private func requestUserList() {
        userViewModel.requestUserInformation { (error) in
            if error != nil {
                guard let errorMessage = error?.localizedDescription else { return }
                self.alertMessageWithoutAction(title: nil, message: errorMessage)
            }else {
                self.userTableView.reloadData()
            }
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfListUserData = userViewModel.userInfoList?.count else { return 0 }
        return numberOfListUserData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LIST_USER_CELL", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        
        if let userInfo = userViewModel.userInfoList {
            let model = userInfo[indexPath.row]
            cell.config(model: model)
        }
        
        return cell
    }
    
}

