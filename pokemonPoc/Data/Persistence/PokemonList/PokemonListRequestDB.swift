//
//  PokemonListRequestDB.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonListRequestDB {
    func savePokemonList(pokemon: PokemonListObject, success: @escaping (Bool)->Void)
    func getSavedPokemonList(success: @escaping (PokemonListObject)->Void, failure: @escaping (CustomError)->Void)
}
