//
//  LoginViewModel.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/17.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var loginModel: Response!
    
    func requestLogin(usrID: String, usrPW: String, completion: @escaping (Result<Response, NSError>) -> Void) {
        
        let reqBody = Request(USER_ID: usrID, USER_PW: usrPW)
        
        NetworkHandler.shared.fetch(api: "http://demo.jexframe.com/demo_login.jct", body: reqBody, responseType: Response.self) { (result) in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let responseObj):
                print(responseObj)
                self.loginModel = responseObj
            }
        }
    }
}
