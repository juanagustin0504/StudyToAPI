//
//  NetworkHandler.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/14.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class NetworkHandler {
    class func getData(resource: String) {
        // 세션 생성, 환경 설정
        let defaultSession = URLSession(configuration: .default)
        
        guard let URL = URL(string: "\(resource)") else {
            print("URL is nil")
            return
        }
        
        // Request
        let request = URLRequest(url: URL)
        
        // DataTask
        let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            // getting Data error
            guard error == nil else {
                print("Error occur: \(String(describing: error))")
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            // 통신에 성공한 경우 data에 Data 객체가 전달된다.
            
            // 받아오는 형태가 json 형태일 경우,
            // json을 serialize하여 json 데이터를 swift 데이터 타입으로 변환
            // json serialize란 json 형태를 String으로 만들어 swift에서도 사용할 수 있게 만드는 것
            guard let jsonToArray = try? JSONSerialization.jsonObject(with: data, options: []) else {
                print("json to Any error")
                return
            }
            
            // 원하는 작업
            print(jsonToArray)
        }
        dataTask.resume()
    }
}
