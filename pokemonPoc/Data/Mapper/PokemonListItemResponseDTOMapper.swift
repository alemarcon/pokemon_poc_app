//
//  PokemonListItemResponseDTOMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation

struct PokemonListItemResponseDTOMapper {
    
    /// Map PokemonListItemDTO to PokemonItemModel
    /// - Parameter pokemon: PokemonListItemDTO object to map
    /// - Returns: PokemonItemModel mapped object
    static func mapDtoArrayToModelArray(pokemon: PokemonListItemDTO) -> PokemonItemModel {
        var model = PokemonItemModel()
        
        if let url = pokemon.url {
            model.id = getPokemonID(url: url)
            model.detailUrl = url
        }
        model.name = pokemon.name ?? ""
        
        
        return model
    }
    
    /// Map PokemonListItemDTO to PokemonItemModel object
    /// - Parameter pokemon: PokemonListItemDTO object to map
    /// - Returns: PokemonItemModel mapped object
    static func mapDtoArrayToEntityArray(pokemon: PokemonListItemDTO) -> PokemonItemObject {
        let model = PokemonItemObject()
        
        if let url = pokemon.url {
            model.pokemonId = getPokemonID(url: url)
            model.detailUrl = url
        }
        model.name = pokemon.name ?? ""
        
        
        return model
    }
    
    /// Get pokemon ID from detail url
    /// - Parameter url: Detail pokemon API url
    /// - Returns: String rappresent pokemon ID
    private static func getPokemonID(url: String) -> String {
        let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
        return url.suffix(from: baseUrl.endIndex).replacingOccurrences(of: "/", with: "")
    }
    
}
