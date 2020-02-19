//
//  LoginViewModel.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/17.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var loginModel: LoginModel.Response? = nil
    
    func requestLogin(usrID: String, usrPW: String, completion: @escaping (NSError?) -> Void) {
        
        let reqBody = LoginModel.Request(USR_ID: usrID, USR_PW: usrPW)
        print("============================REQEUST============================")
        print(reqBody)
        
        NetworkHandler.shared.fetch(api: "http://demo.jexframe.com/demo_login.jct", body: reqBody, responseType: LoginModel.Response.self) { (result) in
            
            switch result {
            case .failure(let error):
                print(error)
                completion(error)
            case .success(let responseObj):
                print("============================RESPONSE============================")
                print(responseObj)
                self.loginModel = responseObj
                completion(nil)
            }
        }
    }
}
