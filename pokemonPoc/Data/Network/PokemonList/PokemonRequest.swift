//
//  PokemonRequest.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonRequest {
    
    /// Load pokemon list by API
    /// - Parameters:
    ///   - offset: Pokemon offset to load
    ///   - success: Event fired on success
    ///   - failure: Event fired on error
    func loadPokemonList<T: Decodable>(offset: String, success: @escaping (T)->Void, failure: @escaping (CustomError)->Void)
    
    /// Load pokemon detail from API
    /// - Parameters:
    ///   - path: Detail path
    ///   - success: Event fired on success
    ///   - failure: Event fired on error
    func loadPokemonDetail<T: Decodable>(path: String, success: @escaping (T)->Void, failure: @escaping (CustomError)->Void)
}
