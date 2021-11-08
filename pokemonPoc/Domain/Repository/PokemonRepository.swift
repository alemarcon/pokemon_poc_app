//
//  PokemonRepository.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonRepository {
    
    var request: PokemonRequest? { get }
    
    /// Search user by username
    /// - Parameters:
    ///   - username: Username to search
    ///   - success: Action fired in case of success
    ///   - failure: Action fired in case of failure
    func getPokemons(offset: String, success: @escaping (PokemonsModel)->Void, failure: @escaping (CustomError)->Void)

}
