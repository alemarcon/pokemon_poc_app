//
//  PokemonListResponseDTOMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

struct PokemonListResponseDTOMapper {
    
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

struct PokemonListItemResponseDTOMapper {
    
    static func mapDtoArrayToModelArray(pokemon: PokemonListItemDTO) -> PokemonItemModel {
        var model = PokemonItemModel()
        
        if let url = pokemon.url {
            model.id = getPokemonID(url: url)
            model.detailUrl = url
        }
        model.name = pokemon.name ?? ""
        
        
        return model
    }
    
    static func mapDtoArrayToEntityArray(pokemon: PokemonListItemDTO) -> PokemonItemObject {
        let model = PokemonItemObject()
        
        if let url = pokemon.url {
            model.pokemonId = getPokemonID(url: url)
            model.detailUrl = url
        }
        model.name = pokemon.name ?? ""
        
        
        return model
    }
    
    private static func getPokemonID(url: String) -> String {
        let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
        return url.suffix(from: baseUrl.endIndex).replacingOccurrences(of: "/", with: "")
    }
    
}
