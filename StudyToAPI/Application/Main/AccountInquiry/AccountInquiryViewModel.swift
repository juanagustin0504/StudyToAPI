//
//  AccountInquiryViewModel.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/18.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class AccountInquiryViewModel {
    
    var responseObj: AccountInquiryModel.Response? = nil
    
    func requsetAccountInquiry(ACCT_NO: String, completion: @escaping (NSError?) -> Void) {
        let reqBody = AccountInquiryModel.Request(ACCT_NO: ACCT_NO)
        NetworkHandler.shared.fetch(api: "http://demo.jexframe.com/poc_amount_single_view.jct", body: reqBody, responseType: AccountInquiryModel.Response.self) { (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let data):
                self.responseObj = data
                completion(nil)
            }
        }
    }
    
    
}
