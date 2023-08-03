//
//  Router.swift
//  WeatherApp
//
//  Created by Grishma Dave on 30/07/23.
//

import Foundation

enum HTTPMethod : String {
 case get
case post
}
protocol Routeble {
    var path:String {get  }
    var method: HTTPMethod { get  }
    var parameters: [String:String] { get }
}

enum Router: Routeble {
    
    case getCurrentWeather(key:String, city:String)
    
    static let localURL = "http://api.weatherapi.com/v1"
    
    var path: String {
        switch self {
        case .getCurrentWeather(let key, let city):
            return Router.localURL + "/current.json" + "?key=\(key)&q=\(city)"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCurrentWeather:
            return .get
        }
    }
}

extension Router {
    var parameters: [String:String] {
        switch self {
        case .getCurrentWeather(_,_):
            return [:]
        }
    }
}
