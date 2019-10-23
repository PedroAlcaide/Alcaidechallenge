//
//  ApiResource.swift
//  Desafio
//
//  Created by Pedro Alcaide on 22/10/2019.
//  Copyright © 2019 Pedro Alcaide. All rights reserved.
//

import UIKit

class ApiResourcer {
    
    public func getTopRatedSwiftRepositories(page: Int = 1, completion: @escaping ([GHItem]) -> Void) {
        let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&page=\(page)")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let jsonData = json as? [String: Any], let jsonItems = jsonData["items"] as? [[String: Any]] {
                    var items: [GHItem] = []
                    
                    for ji in jsonItems {
                        if let item = GHItem(json: ji) {
                            items.append(item)
                        }
                    }
                    DispatchQueue.main.async {
                        completion(items)
                    }
                }
            } catch  {
                print("Error")
            }
        }
        
        task.resume()
        
    }
}
