//
//  PokemonListResponseDTOMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

struct PokemonListResponseDTOMapper {
    
    /// Map PokemonListResponseDTO to PokemonsModel
    /// - Parameter pokemons: PokemonListResponseDTO object to map
    /// - Returns: PokemonsModel mapped object
    static func mapDtoToModel(pokemons: PokemonListResponseDTO) -> PokemonsModel {
        var model = PokemonsModel()
        
        model.count = pokemons.count ?? 0
        model.next = pokemons.next
        model.previous = pokemons.previous
        
        if let result = pokemons.results {
            for item in result {
                model.pokemonList.append( PokemonListItemResponseDTOMapper.mapDtoArrayToModelArray(pokemon: item) )
            }
        }
        
        return model
    }
    
    
    /// Map PokemonListResponseDTO to PokemonListObject
    /// - Parameter pokemons: PokemonListResponseDTO object to map
    /// - Returns: PokemonListObject mapped object
    static func mapDtoToEntity(pokemons: PokemonListResponseDTO) -> PokemonListObject {
        let model = PokemonListObject()
        
        model.next = pokemons.next
        model.prev = pokemons.previous
        
        if let result = pokemons.results {
            for item in result {
                model.pokemon.append( PokemonListItemResponseDTOMapper.mapDtoArrayToEntityArray(pokemon: item) )
            }
        }
        
        return model
    }
    
    
}
