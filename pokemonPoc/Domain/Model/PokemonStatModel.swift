//
//  PokemonStatModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonStatModel: DetailItem {
    var type: DetailType
    var baseStat: Int
    var statName: String
    
    init() {
        type = .stats
        baseStat = 0
        statName = ""
    }
}
