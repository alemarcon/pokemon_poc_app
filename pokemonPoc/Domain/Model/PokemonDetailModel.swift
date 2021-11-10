//
//  PokemonDetailModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonDetailModel {
    var name: String
    var images: [PokemonImageModel]
    var stats: [PokemonStatModel]
    var category: [PokemonTypeModel]
    
    init() {
        name = ""
        images = [PokemonImageModel]()
        stats = [PokemonStatModel]()
        category = [PokemonTypeModel]()
    }
    
}
