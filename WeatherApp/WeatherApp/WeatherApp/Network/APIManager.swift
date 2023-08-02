//
//  APIManager.swift
//  WeatherApp
//
//  Created by Grishma Dave on 30/07/23.
//

import Foundation

class APIManager {
    
    static let shared: APIManager = APIManager()
    func request<T: Codable>(route: Router,type: T.Type,complition:@escaping(_ result:T) -> Void) {
        
        // Step 1
        let path: String = route.path
        print(path)
        
        // Step 2
        let urlRequest: URLRequest = URLRequest(url: URL(string: path)!)
        
        // Step 3
        let urlSession: URLSession = URLSession(configuration: .default)
        
        // Step 4
        urlSession.dataTask(with: urlRequest, completionHandler: { (data,response,error) in
            if let responseData = data {
               
                // Step 5
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type.self, from: responseData)
                    /*
                    for joke in jokes.jokes {
                        
                        if joke.type == .single {
                            print(joke.joke ?? "")
                        } else {
                            print(joke.setup ?? "")
                            print("...\(joke.delivery ?? "")")
                        }
                        print("")
                        print("")
                    }
                    */
                    complition(result)
                } catch {
                    print("Error Decodiong \(error.localizedDescription)")
                }
            }
            
        }).resume()
    }
}



