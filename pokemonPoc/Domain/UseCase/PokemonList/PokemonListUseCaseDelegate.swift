//
//  PokemonListUseCaseDelegate.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonListUseCaseDelegate {
    
    /// Delegate method called in case of pokemon loading fails
    /// - Parameter error: The error occurred
    func pokemonLoadingFails(error: CustomError)
    
    /// Delegate method called in case of success of pokemon loading
    /// - Parameter players: Pokemon list
    func pokemonLoadingSuccess(pokemon: PokemonsModel)
}
