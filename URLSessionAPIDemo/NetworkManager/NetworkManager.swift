//
//  NetworkManager.swift
//  URLSessionAPIDemo
//
//  Created by Akshay Kumar on 21/04/23.
//

import Foundation

typealias ComplitionBlockWithDict = ([String: Any], _ error: String) -> Void


struct APIURL {
    static let basseUrl = "https://gorest.co.in/public/v1/users"
}


class DataService {
    
    static let sharedInstance = DataService()
    
    func getUser( completionHandler: @escaping ComplitionBlockWithDict) {
        guard let url = URL(string: APIURL.basseUrl) else {
            completionHandler([:], "Something went Wrong")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completionHandler([:], "Something went Wrong")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completionHandler([:], "Something went Wrong")
                return
            }
            
            guard let data = data else {
                completionHandler([:], "Something went Wrong")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                completionHandler(json ?? [:], "Something went Wrong")
            } catch let error {
                print(error)
                completionHandler([:], "Something went Wrong")
            }
        }
        
        task.resume()
    }
    
}
