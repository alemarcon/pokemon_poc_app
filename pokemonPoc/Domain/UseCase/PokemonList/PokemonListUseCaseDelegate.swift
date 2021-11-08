//
//  PokemonListUseCaseDelegate.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

protocol PokemonListUseCaseDelegate {
    
    /// Delegate method called in case of best player call fails
    /// - Parameter error: The error occurred
    func pokemonLoadingFails(error: CustomError)
    
    /// Delegate method called in case of success of best player success
    /// - Parameter players: Array object of UserModel
    func pokemonLoadingSuccess(pokemon: PokemonsModel)
}
