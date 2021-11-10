//
//  PokemonDetailUseCaseDelegate.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

protocol PokemonDetailUseCaseDelegate {
    
    func pokemonDetailsFound(detail: PokemonDetailModel)
    func pokemonDetailsFail(error: CustomError)
}
