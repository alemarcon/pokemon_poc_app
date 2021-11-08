//
//  PokemonListResponseDBMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonListResponseDBMapper {
    
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

struct PokemonListItemResponseDBMapper {
    
    static func mapDtoArrayToModelArray(pokemon: PokemonItemObject) -> PokemonItemModel {
        var model = PokemonItemModel()
        
        model.id = pokemon.pokemonId
        model.detailUrl = pokemon.detailUrl
        model.name = pokemon.name
        
        
        return model
    }
    
}
