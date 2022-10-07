//
//  DataService.swift
//  RequestAPI
//
//  Created by Cuong on 7/24/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class DataService {
    static var sharedInstance: DataService = DataService()
    func getDataFromAPI(completedHandle: @escaping([User]) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/todos"
        guard let url = urlComponents.url else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let downloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                if let data = data {
                    data.printFormatedJSON()
                    let usersData = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        completedHandle(usersData.self)
                    }
                }
            } catch {}
        })
        downloadTask.resume()
    }
}
