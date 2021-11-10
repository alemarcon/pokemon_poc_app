//
//  PokemonListResponseDBMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonListResponseDBMapper {
    
    /// Map PokemonListObject object to PokemonsModel object
    /// - Parameter pokemons: PokemonListObject object to map
    /// - Returns: PokemonsModel mapped object
    static func mapDtoToModel(pokemons: PokemonListObject) -> PokemonsModel {
        var model = PokemonsModel()
        
        model.next = pokemons.next
        model.previous = pokemons.prev
        
        for item in pokemons.pokemon {
            model.pokemonList.append( PokemonListItemResponseDBMapper.mapDtoArrayToModelArray(pokemon: item) )
        }
        
        return model
    }
    
}
