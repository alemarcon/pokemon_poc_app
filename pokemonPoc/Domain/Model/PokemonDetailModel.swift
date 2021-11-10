//
//  PokemonDetailModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonDetailModel {
    var name: String
    var items: [DetailItem]
    
    init() {
        name = ""
        items = [DetailItem]()
    }
    
}
