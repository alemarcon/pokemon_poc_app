//
//  PokemonListRequestDB.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonListRequestDB {
    
    /// Save pokemon list in database
    /// - Parameters:
    ///   - pokemon: Pokemon object to save
    ///   - success: Event fired in case of success with TRUE or in case of error with FALSE
    func savePokemonList(pokemon: PokemonListObject, success: @escaping (Bool)->Void)
    
    /// Get previously saved pokemon list
    /// - Parameters:
    ///   - success: Event fired in success case
    ///   - failure: Event fired in error case
    func getSavedPokemonList(success: @escaping (PokemonListObject)->Void, failure: @escaping (CustomError)->Void)
}
