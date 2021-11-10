//
//  PokemonTypeModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonTypeModel: DetailItem {
    
    var type: DetailType
    var slot: Int
    var name: String
    
    init() {
        slot = 0
        name = ""
        type = .category
    }
}
