//
//  PokemonRepositoryDefault.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

class PokemonRepositoryDefault: PokemonRepository {
    
    var request: PokemonRequest?
    var dbRequest: PokemonListRequestDB?
    
    init(request: PokemonRequest, dbRequest: PokemonListRequestDB) {
        self.request = request
        self.dbRequest = dbRequest
    }
    
    func getPokemons(offset: String, success: @escaping (PokemonsModel)->Void, failure: @escaping (CustomError)->Void) {
        
        request?.loadPokemonList(offset: offset, success: { (result: PokemonListResponseDTO) in
            self.dbRequest?.savePokemonList(pokemon: PokemonListResponseDTOMapper.mapDtoToEntity(pokemons: result), success: { saved in
                success(PokemonListResponseDTOMapper.mapDtoToModel(pokemons: result))
            })
        }, failure: { error in
            if( error.customErrorCode == .noConnection ) {
                self.dbRequest?.getSavedPokemonList(success: { pokemon in
                    success( PokemonListResponseDBMapper.mapDtoToModel(pokemons: pokemon) )
                }, failure: { dbError in
                    failure(dbError)
                })
            } else {
                failure(error)
            }
        })
    }
    
}
