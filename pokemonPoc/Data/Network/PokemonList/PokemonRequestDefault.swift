//
//  PokemonRequestDefault.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

class PokemonRequestDefault: PokemonRequest {
    
    func loadPokemonList<T>(offset: String, success: @escaping (T)->Void, failure: @escaping (CustomError)->Void) where T : Decodable {
        let router = PokemonRouter(type: .list(offset: offset))
        NetworkRequestPerformer.performRequest(router: router, success: success, failure: failure)
    }
    
    func loadPokemonDetail<T>(path: String, success: @escaping (T) -> Void, failure: @escaping (CustomError) -> Void) where T : Decodable {
        let router = PokemonRouter(type: .detail(url: path))
        NetworkRequestPerformer.performRequest(router: router, success: success, failure: failure)
    }
}
