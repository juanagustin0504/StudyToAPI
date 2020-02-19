//
//  AccountInquiryModel.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/18.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct AccountInquiryModel {
    
    struct Request: Encodable {
        let ACCT_NO         : String
    }
    
    struct Response: Decodable {
        let USR_ID          : String
        let ACCT_NO         : String
        let ACCT_TP         : String
        let ACCT_BAL        : String
        let WDRW_POSS_AMT   : String
        let ACCT_NEW_DT     : String
    }
    
}
