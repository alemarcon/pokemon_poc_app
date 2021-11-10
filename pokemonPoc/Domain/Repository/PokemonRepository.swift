//
//  PokemonRepository.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonRepository {
    
    /// Network request
    var request: PokemonRequest? { get }
    /// DB request
    var dbRequest: PokemonListRequestDB? { get }
    
    /// Get pokemon data
    /// - Parameters:
    ///   - offset: The number of pokemons to get
    ///   - success: Event called in case of success
    ///   - failure: Event called in case of error
    func getPokemons(offset: String, success: @escaping (PokemonsModel)->Void, failure: @escaping (CustomError)->Void)
    
    /// Get pokemon detail
    /// - Parameters:
    ///   - path: Detail path for desired pokemon
    ///   - success: Event called on success
    ///   - failure: Event called on error
    func getPokemonDetail(path: String, success: @escaping (PokemonDetailModel)->Void, failure: @escaping (CustomError)->Void)
}
