//
//  PokemonDetailResponseDTO.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonDetailResponseDTO: Decodable {
    let id: Int?
    let name: String?
    let sprites: PokemonSpriteResponseDTO?
    let stats: [PokemonStatsResponseDTO]?
    let types: [PokemonTypeElementeResponseDTO]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case sprites = "sprites"
        case stats = "stats"
        case types = "types"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sprites = try values.decodeIfPresent(PokemonSpriteResponseDTO.self, forKey: .sprites)
        stats = try values.decodeIfPresent([PokemonStatsResponseDTO].self, forKey: .stats)
        types = try values.decodeIfPresent([PokemonTypeElementeResponseDTO].self, forKey: .types)
    }
}
