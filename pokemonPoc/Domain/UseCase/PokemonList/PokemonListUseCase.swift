//
//  PokemonListUseCase.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonListUseCase {

    var repository: PokemonRepository? { get }
    var delegate: PokemonListUseCaseDelegate? { get set }
    
    /// Load pokemon list
    func loadPokemons(offset: String)
}
