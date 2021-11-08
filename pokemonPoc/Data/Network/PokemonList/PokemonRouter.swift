//
//  PokemonRouter.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation

enum PokemonRouterType {
    case list
}

struct PokemonRouter: APIConfiguration {
    
    var method: HTTPMethod
    var path: String
    var queryItems: [URLQueryItem]?
    var requestHeader: [String : String]?
    
    init(type: PokemonRouterType, offset: String) {
        switch type {
        case .list:
            method = .get
            path = API.baseURL + "pokemon"
            queryItems = [
                URLQueryItem(name: "offset", value: offset),
                URLQueryItem(name: "limit", value: "20")
            ]
        }
    }
    
    func toUrlRequest() -> URLRequest {
        var url: URL!
        
        let requestHeader = requestHeader
        var requestBodyComponent = URLComponents()
        requestBodyComponent.queryItems = queryItems
        
        if( method == .get ) {
            url = URL(string: path + requestBodyComponent.description)!
        } else {
            url = URL(string: path)!
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = requestHeader
        
        if( method == .post ) {
            request.httpBody = requestBodyComponent.query?.data(using: .utf8)
        }
        return request
    }
    
    
}
