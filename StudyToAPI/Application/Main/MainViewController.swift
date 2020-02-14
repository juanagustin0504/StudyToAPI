//
//  MainViewController.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/14.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        NetworkHandler.getData(resource: "http://demo.jexframe.com/demo_login.jct")
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
