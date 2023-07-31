//
//  Router.swift
//  WeatherApp
//
//  Created by Grishma Dave on 30/07/23.
//

import Foundation
import Alamofire

protocol Routeble {
    var path:String {get  }
    var method: HTTPMethod { get  }
    var parameters: Parameters { get }
}

enum Router: Routeble {
    
    case getCurrentWeather(Parameters)
    case movieList(Parameters)
    case swipeGuru(Parameters)
    case googlePlace(Parameters)
    
    static let localURL = "http://api.weatherapi.com/v1"
    
    var path: String {
        switch self {
        case .getCurrentWeather:
            return localURL + "/current.json"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCurrentWeather,.googlePlace,.movieList:
            return .get
        case .swipeGuru(_):
            return .post
            
        }
    }
}

extension Router {
    var parameters: Parameters {
        switch self {
        case .getCurrentWeather(let params),.googlePlace(let params),.movieList(let params),.swipeGuru(let params):
            return params
            
        }
    }
}
