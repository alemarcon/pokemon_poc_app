//
//  PokemonDetailModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

struct PokemonDetailModel: Hashable {
    var id: String
    var name: String
    var images: [PokemonImageModel]
    var stats: [PokemonStatModel]
    var type: [PokemonTypeModel]
    
    init() {
        id = ""
        name = ""
        images = [PokemonImageModel]()
        stats = [PokemonStatModel]()
        type = [PokemonTypeModel]()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PokemonDetailModel, rhs: PokemonDetailModel) -> Bool {
        lhs.id == rhs.id
    }
}
