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
    
    /// <#Description#>
    /// - Parameters:
    ///   - offset: <#offset description#>
    ///   - success: <#success description#>
    ///   - failure: <#failure description#>
    func getPokemons(offset: String, success: @escaping (PokemonsModel)->Void, failure: @escaping (CustomError)->Void)
    
    /// <#Description#>
    /// - Parameters:
    ///   - path: <#path description#>
    ///   - success: <#success description#>
    ///   - failure: <#failure description#>
    func getPokemonDetail(path: String, success: @escaping (PokemonDetailModel)->Void, failure: @escaping (CustomError)->Void)
}
