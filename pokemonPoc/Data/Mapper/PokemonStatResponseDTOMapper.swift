//
//  PokemonStatResponseDTOMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation

struct PokemonStatResponseDTOMapper {
    
    /// Map PokemonStatsResponseDTO object to PokemonStatModel object
    /// - Parameter dto: PokemonStatsResponseDTO object to map
    /// - Returns: PokemonStatModel mapped object
    static func mapDtoToModel(dto: PokemonStatsResponseDTO) -> PokemonStatModel {
        var model = PokemonStatModel()
        
        model.type = .stats
        model.baseStat = dto.baseStat ?? 0
        model.statName = dto.stat?.name ?? ""
        
        return model
    }
    
    /// Map PokemonStatsResponseDTO object array to PokemonStatModel object array
    /// - Parameter dtos: PokemonStatsResponseDTO object array to map
    /// - Returns: PokemonStatModel object array mapped
    static func mapDtoArrayToModelArray(dtos: [PokemonStatsResponseDTO]) -> [PokemonStatModel] {
        var modelArray = [PokemonStatModel]()
        
        for dto in dtos {
            modelArray.append(mapDtoToModel(dto: dto))
        }
        
        return modelArray
    }
    
}
