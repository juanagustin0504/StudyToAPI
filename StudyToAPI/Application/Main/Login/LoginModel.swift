//
//  LoginModel.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/17.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct LoginModel {
    struct Request: Encodable {
        let USR_ID: String
        let USR_PW: String
    }
    
    struct Response: Decodable {
        
        let USR_NM: String?
        let COMMON_HEAD: COMMON_HEAD_DATA
        let USR_ID: String?
        let RESULT_TP: String
        
        struct COMMON_HEAD_DATA: Decodable {
            let UUID: String
            let ERROR: Bool
            let MESSAGE: String
            let CODE: String
        }
    }

    
}


