//
//  PokemonDetailResponseDTOMapper.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonDetailResponseDTOMapper {
    
    /// Map PokemonDetailResponseDTO to PokemonDetailModel object
    /// - Parameter dto: PokemonDetailResponseDTO object to map
    /// - Returns: PokemonDetailModel mapped object
    static func mapDtoToModel(dto: PokemonDetailResponseDTO) -> PokemonDetailModel {
        var model = PokemonDetailModel()
        
        model.name = dto.name ?? ""
        
        if let sprites = dto.sprites {
            
            if let frontDefault = sprites.frontDefault {
                var image = PokemonImageModel()
                image.url = frontDefault
                model.images.append(image)
            }
            if let backDefault = sprites.backDefault {
                var image = PokemonImageModel()
                image.url = backDefault
                model.images.append(image)
            }
            if let frontShiny = sprites.frontShiny {
                var image = PokemonImageModel()
                image.url = frontShiny
                model.images.append(image)
            }
            if let backShiny = sprites.backShiny {
                var image = PokemonImageModel()
                image.url = backShiny
                model.images.append(image)
            }
        }
        
        if let stats = dto.stats {
            model.stats.append(contentsOf: PokemonStatResponseDTOMapper.mapDtoArrayToModelArray(dtos: stats))
        }
        
        if let types = dto.types {
            model.category.append(contentsOf: PokemonTypeElementResponseDTOMapper.mapDtoArrayToModelArray(dtos: types))
        }
        
        return model
    }
    
}
