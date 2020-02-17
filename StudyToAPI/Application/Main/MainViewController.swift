//
//  MainViewController.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/14.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let loginViewModel: LoginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
//        NetworkHandler.getData(resource: "http://demo.jexframe.com/demo_login.jct")
//        NetworkHandler.getData(resource: "http://demo.jexframe.com/demo_login.jct") { (result) in
//            switch result {
//            case .failure(let error):
//                print("error: \(error)")
//            case .success(let data):
//                print("success: \(data)")
//            }
//        }
        
//        NetworkHandler.shared.fetch(api: "http://demo.jexframe.com/demo_login.jct", responseType: Response.self) { (result) in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let responseObj):
//                print(responseObj)
//            }
//        }
        
        

        
        loginViewModel.requestLogin(usrID: "webcash", usrPW: "1111") { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                print(data)
            }
        }
        
//        print(loginViewModel.loginModel)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
