//
//  PokemonRepositoryDefault.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

class PokemonRepositoryDefault: PokemonRepository {
    
    var request: PokemonRequest?
    
    init(request: PokemonRequest) {
        self.request = request
    }
    
    func getPokemons(offset: String, success: @escaping (PokemonsModel)->Void, failure: @escaping (CustomError)->Void) {
        
        request?.loadPokemonList(offset: offset, success: { (result: PokemonListResponseDTO) in
            success(PokemonListResponseDTOMapper.mapDtoArrayToModelArray(pokemons: result))
        }, failure: { error in
            failure(error)
        })
    }
    
}
