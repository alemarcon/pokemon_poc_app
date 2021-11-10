//
//  PokemonImageModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonImageModel: DetailItem {
    var type: DetailType
    var url: String
    
    init() {
        type = .image
        url = ""
    }
}
