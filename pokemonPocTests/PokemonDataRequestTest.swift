//
//  PokemonDataRequestTest.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation

class PokemonDataRequestTest: PokemonRequest {
    
    func loadPokemonList<T>(offset: String, success: @escaping (T) -> Void, failure: @escaping (CustomError) -> Void) where T : Decodable {
        let filePath = Bundle.main.path(forResource: "pokemon_list_response_200", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))

        let decoder: JSONDecoder = JSONDecoder.init()
        let response: PokemonListResponseDTO = try! decoder.decode(PokemonListResponseDTO.self, from: data)
        success(response as! T)
    }
    
    func loadPokemonDetail<T>(path: String, success: @escaping (T) -> Void, failure: @escaping (CustomError) -> Void) where T : Decodable {
        let filePath = Bundle.main.path(forResource: "pokemon_detail_response_200", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))

        let decoder: JSONDecoder = JSONDecoder.init()
        let response: PokemonDetailResponseDTO = try! decoder.decode(PokemonDetailResponseDTO.self, from: data)
        success(response as! T)
    }
    
}
