//
//  PokemonTypeElementResponseDTOMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation

struct PokemonTypeElementResponseDTOMapper {
    
    /// Map PokemonTypeElementeResponseDTO object array to PokemonTypeModel object
    /// - Parameter dto: PokemonTypeElementeResponseDTO object to map
    /// - Returns: PokemonTypeModel mapped object
    static func mapDtoToModel(dto: PokemonTypeElementeResponseDTO) -> PokemonTypeModel {
        var model = PokemonTypeModel()
        
        model.type = .category
        model.slot = dto.slot ?? 0
        model.name = dto.type?.name ?? ""
        
        return model
    }
    
    /// Map PokemonTypeElementeResponseDTO object array to PokemonTypeModel object array
    /// - Parameter dtos: PokemonTypeElementeResponseDTO object array to map
    /// - Returns: PokemonTypeModel mapped object array
    static func mapDtoArrayToModelArray(dtos: [PokemonTypeElementeResponseDTO]) -> [PokemonTypeModel] {
        var modelArray = [PokemonTypeModel]()
        
        for dto in dtos {
            modelArray.append(mapDtoToModel(dto: dto))
        }
        
        return modelArray
    }
    
}
