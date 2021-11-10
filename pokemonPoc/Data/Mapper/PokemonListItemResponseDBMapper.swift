//
//  PokemonListItemResponseDBMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation

struct PokemonListItemResponseDBMapper {
    
    /// Map PokemonItemObject object to PokemonItemModel object
    /// - Parameter pokemon: PokemonItemObject object to map
    /// - Returns: PokemonItemModel mapped object
    static func mapDtoArrayToModelArray(pokemon: PokemonItemObject) -> PokemonItemModel {
        var model = PokemonItemModel()
        
        model.id = pokemon.pokemonId
        model.detailUrl = pokemon.detailUrl
        model.name = pokemon.name
        
        return model
    }
    
}
