//
//  Configuration.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 03/11/21.
//

import Foundation

//MARK: - Api Data
enum API {
    
    /// Get API base URL
    static var baseURL: String {
        var baseEndpoint = ""
        do {
            baseEndpoint = try Configuration.value(for: "API_BASE_URL") as String
        } catch(let error) {
            LOGE("Configuration error => \(error)")
            baseEndpoint = "https://pokeapi.co/api/v2/"
        }
        return baseEndpoint
    }
    
    /// Get base image endpoint
    static var baseImageURL: String {
        var baseImageEndpoint = ""
        do {
            baseImageEndpoint = try Configuration.value(for: "BASE_IMAGE_URL") as String
        } catch(let error) {
            LOGE("Configuration error => \(error)")
            baseImageEndpoint = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        }
        return baseImageEndpoint
    }

}

//MARK: - Configuration
enum Configuration {
    
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
