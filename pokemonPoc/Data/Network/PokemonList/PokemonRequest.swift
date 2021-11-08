//
//  PokemonRequest.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonRequest {
    
    func loadPokemonList<T: Decodable>(offset: String, success: @escaping (T)->Void, failure: @escaping (CustomError)->Void)
}
