//
//  PokemonImageModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonImageModel {
    var url: String
    
    init() {
        url = ""
    }
    
    init(url: String) {
        self.url = url
    }
}
