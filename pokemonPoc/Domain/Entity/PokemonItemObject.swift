//
//  PokemonItemObject.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation
import RealmSwift

/// Object reppresenting pokemon item
class PokemonItemObject: Object {
    @Persisted(primaryKey: true) var _id = UUID().uuidString
    @Persisted var pokemonId: String = ""
    @Persisted var name: String = ""
    @Persisted var detailUrl: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
