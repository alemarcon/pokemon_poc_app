//
//  PokemonDetailUseCaseDelegate.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

protocol PokemonDetailUseCaseDelegate {
    
    /// Delegate method called in case of details found
    /// - Parameter detail: Pokemon details
    func pokemonDetailsFound(detail: PokemonDetailModel)
    
    /// Delegate method called in case of error
    /// - Parameter error: The error occurred
    func pokemonDetailsFail(error: CustomError)
}
