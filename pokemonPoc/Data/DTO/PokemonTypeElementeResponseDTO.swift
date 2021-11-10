//
//  PokemonTypeElementeResponseDTO.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonTypeElementeResponseDTO: Decodable {
    let slot: Int?
    let type: PokemonTypeItemResponseDTO?

    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        slot = try values.decodeIfPresent(Int.self, forKey: .slot)
        type = try values.decodeIfPresent(PokemonTypeItemResponseDTO.self, forKey: .type)
    }
}
