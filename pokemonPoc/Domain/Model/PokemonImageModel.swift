//
//  PokemonImageModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

class PokemonImageModel: DetailItem {
    var type: DetailType
    var url: [String]
    
    init() {
        type = .image
        url = [String]()
    }
}
