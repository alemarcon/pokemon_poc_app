//
//  APIConfiguration.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 03/11/21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol APIConfiguration {
    
    /// Define HTTP method for network request
    var method: HTTPMethod { get }
    /// API Endpoint
    var path: String { get }
    /// API parameters
    var queryItems: [URLQueryItem]? { get }
    /// API Header
    var requestHeader: [String: String]? { get }
    
    /// Transform properties in URLRequest object
    func toUrlRequest() -> URLRequest
}
