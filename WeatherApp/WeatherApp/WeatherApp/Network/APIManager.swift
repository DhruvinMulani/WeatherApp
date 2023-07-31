//
//  APIManager.swift
//  WeatherApp
//
//  Created by Grishma Dave on 30/07/23.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared: APIManager = APIManager()
    
    func request<T: Codable>(route: Router,type: T.Type,complition:@escaping(_ result:T) -> Void) {
        
        var params:[String:String] = [:]
        var path:String = route.path
        if route.method == .get {
            for (key, value) in route.parameters {
                path.append("?\(key)=\(value)")
                path.append("&\(key)=\(value)")
            }
        } else {
            params = route.parameters as! [String : String]
        }
        print("API Path \(path)")
        print("API Method \(route.method)")
        print("API Parameters \(params)")
        
        Alamofire.request(route.path, method: route.method, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { (response) in
            switch response.result  {
            case .success(let value):
                if let resultData = try? JSONDecoder().decode(type.self, from: value) {
                    complition(resultData)
                }
                    break;
            case .failure(let  error):
                    print(error.localizedDescription)
                    break;
            }
        }
    }
}




