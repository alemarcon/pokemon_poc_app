//
//  Pokemon.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

struct PokemonsModel {
    
    var count: Int
    var next: String?
    var previous: String?
    var pokemonList: [PokemonItemModel]
    
    init() {
        count = 0
        pokemonList = [PokemonItemModel]()
    }
}
