//
//  PokemonListRequestDBDefault.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation
import RealmSwift

class PokemonListRequestDBDefault: PokemonListRequestDB {
    
    func savePokemonList(pokemon: PokemonListObject, success: @escaping (Bool)->Void) {
        let realm = try! Realm()
        try! realm.write {
            // Delete all existing object
            realm.deleteAll()
            realm.add(pokemon)
            success(true)
        }
    }
    
    func getSavedPokemonList(success: @escaping (PokemonListObject) -> Void, failure: @escaping (CustomError) -> Void) {
        let realm = try! Realm()
        let pokemonList = realm.objects(PokemonListObject.self)
        if let pokemon = pokemonList.first {
            success(pokemon)
        } else {
            failure(CustomError.noSavedObjectFound)
        }
    }
}
