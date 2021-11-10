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
            
            let images = PokemonImageModel()
            
            if let frontDefault = sprites.frontDefault {
                images.url.append(frontDefault)
            }
            if let backDefault = sprites.backDefault {
                images.url.append(backDefault)
            }
            if let frontShiny = sprites.frontShiny {
                images.url.append(frontShiny)
            }
            if let backShiny = sprites.backShiny {
                images.url.append(backShiny)
            }
            model.items.append(images)
        }
        
        if let stats = dto.stats {
            model.items.append(contentsOf: PokemonStatResponseDTOMapper.mapDtoArrayToModelArray(dtos: stats))
        }
        
        if let types = dto.types {
            model.items.append(contentsOf: PokemonTypeElementResponseDTOMapper.mapDtoArrayToModelArray(dtos: types))
        }
        
        return model
    }
    
}


struct PokemonStatResponseDTOMapper {
    
    static func mapDtoToModel(dto: PokemonStatsResponseDTO) -> PokemonStatModel {
        let model = PokemonStatModel()
        
        model.type = .stats
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
        
        model.type = .category
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
