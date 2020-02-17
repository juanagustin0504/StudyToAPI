//
//  Response.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/17.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    let USR_NM: String?
    let COMMON_HEAD: REC
    let USR_ID: String?
    let RESULT_TP: String
    
    struct REC: Decodable {
        let UUID: String
        let ERROR: Bool
        let MESSAGE: String
        let CODE: String
    }
}
