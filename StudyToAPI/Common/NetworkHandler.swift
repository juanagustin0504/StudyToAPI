//
//  NetworkHandler.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/14.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class NetworkHandler {
    private static var sharedInstance = NetworkHandler()
    private static var sessionConfig: URLSessionConfiguration!
    
    static var shared: NetworkHandler = {
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 120
        sessionConfig.timeoutIntervalForResource = 120
        return sharedInstance
    }()
    
    func fetch<I: Encodable, O: Decodable>(api: String, body: I, responseType: O.Type, completion: @escaping (Result<O, NSError>) -> Void) {
        guard let URL = URL(string: api) else {
            print("URL is nil")
            return
        }
        
        // 1. Session 생성
        let session = URLSession(configuration: .default)
        
        // 2. 통신할 URL과 Request 객체 설정
        var request = URLRequest(url: URL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)
        
        
        // 3. 사용할 Task를 결정하고, Completion Handler 작성
        session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error: \(error!)")
                completion(.failure((error! as NSError)))
                return
            }
            
            guard let data = data else {
                print("data error")
                let dataError = NSError(domain: "", code: 1000, userInfo: [:])
                completion(.failure(dataError))
                return
            }
            
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            guard let decodedDataString = dataString.removingPercentEncoding else { return }
            
            guard let dataResult = decodedDataString.data(using: .utf8) else { return }
            do {
                let responseObj = try JSONDecoder().decode(responseType, from: dataResult) // Json Objects and Response Missmatch
                completion(.success(responseObj))
                return
            } catch {
                let decodeError = NSError(domain: "Response mismatch with JSON object", code: 1001, userInfo: [:])
                completion(.failure(decodeError))
            }
            
        }.resume() // 4. 해당 Task 실행, 5. Task 완료 후 Completion Handler 실행
        
        
    }

    private func convertToDictionary(jsonString: String) -> [String:Any]? {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }

        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
        } catch {
            return nil
        }
    }
}
