//
//  PokemonItemModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

struct PokemonItemModel {
    
    var id: String
    var name: String
    var detailUrl: String
    
    init() {
        id = ""
        name = ""
        detailUrl = ""
    }
    
    func getImageUrl() -> URL? {
        let imageUrlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        return URL(string: imageUrlString)
    }
}
