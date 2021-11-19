//
//  Endpoint.swift
//  Performance Galeria
//
//  Created by Luis Segoviano on 12/10/20.
//

import Foundation

enum Endpoint {
    case movies(country_code: String, cinemas: Int)
    case movie
    case login
}


extension Endpoint {
    
    var url: URL {
        switch self {
        
        case .movies(let countryCode, let cinemas):
            return .makeForEndpoint("movies?country_code=\(countryCode)&cinemas=\(cinemas)")
        
        case .movie:
            return .makeForEndpoint("subcategories")
        
        case .login:
            return .makeForEndpoint("oauth/token")
            
        }
        
    }
    
}

private extension URL {
    
    static func makeForEndpoint(_ endpoint: String) -> URL
    {
        let url_base = "https://stage-api.cinepolis.com/v2/"
        return URL(string: url_base + endpoint)!
    }
    
}
