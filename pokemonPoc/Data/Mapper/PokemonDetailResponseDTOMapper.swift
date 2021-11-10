//
//  PokemonDetailResponseDTOMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonDetailResponseDTOMapper {
    
    static func mapDtoToModel(dto: PokemonDetailResponseDTO) -> PokemonDetailModel {
        var model = PokemonDetailModel()
        
        model.name = dto.name ?? ""
        
        if let sprites = dto.sprites {
            if let frontDefault = sprites.frontDefault {
                model.images.append( PokemonImageModel(url: frontDefault) )
            }
            if let backDefault = sprites.backDefault {
                model.images.append( PokemonImageModel(url: backDefault) )
            }
            if let frontShiny = sprites.frontShiny {
                model.images.append( PokemonImageModel(url: frontShiny) )
            }
            if let backShiny = sprites.backShiny {
                model.images.append( PokemonImageModel(url: backShiny) )
            }
        }
        
        if let stats = dto.stats {
            model.stats = PokemonStatResponseDTOMapper.mapDtoArrayToModelArray(dtos: stats)
        }
        
        if let types = dto.types {
            model.type = PokemonTypeElementResponseDTOMapper.mapDtoArrayToModelArray(dtos: types)
        }
        
        return model
    }
    
}


struct PokemonStatResponseDTOMapper {
    
    static func mapDtoToModel(dto: PokemonStatsResponseDTO) -> PokemonStatModel {
        var model = PokemonStatModel()
        
        model.baseStat = dto.baseStat ?? 0
        model.statName = dto.stat?.name ?? ""
        
        return model
    }
    
    static func mapDtoArrayToModelArray(dtos: [PokemonStatsResponseDTO]) -> [PokemonStatModel] {
        var modelArray = [PokemonStatModel]()
        
        for dto in dtos {
            modelArray.append(mapDtoToModel(dto: dto))
        }
        
        return modelArray
    }
    
}

struct PokemonTypeElementResponseDTOMapper {
    
    static func mapDtoToModel(dto: PokemonTypeElementeResponseDTO) -> PokemonTypeModel {
        var model = PokemonTypeModel()
        
        model.slot = dto.slot ?? 0
        model.name = dto.type?.name ?? ""
        
        return model
    }
    
    static func mapDtoArrayToModelArray(dtos: [PokemonTypeElementeResponseDTO]) -> [PokemonTypeModel] {
        var modelArray = [PokemonTypeModel]()
        
        for dto in dtos {
            modelArray.append(mapDtoToModel(dto: dto))
        }
        
        return modelArray
    }
    
}
