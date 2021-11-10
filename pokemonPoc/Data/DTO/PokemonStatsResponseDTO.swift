//
//  PokemonStatsResponseDTO.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonStatsResponseDTO: Decodable {
    let baseStat: Int?
    let effort: Int?
    let stat: PokemonStatItemResponseDTO?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        baseStat = try values.decodeIfPresent(Int.self, forKey: .baseStat)
        effort = try values.decodeIfPresent(Int.self, forKey: .effort)
        stat = try values.decodeIfPresent(PokemonStatItemResponseDTO.self, forKey: .stat)
    }
}
