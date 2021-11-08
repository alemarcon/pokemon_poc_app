//
//  PokemonListObject.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation
import RealmSwift

/// Object reppresenting game in database
class PokemonListObject: Object {
    @Persisted(primaryKey: true) var _id = UUID().uuidString
    @Persisted var next: String?
    @Persisted var prev: String?
    @Persisted var pokemon: List<PokemonItemObject>
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
