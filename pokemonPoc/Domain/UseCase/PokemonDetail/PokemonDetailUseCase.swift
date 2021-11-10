//
//  PokemonDetailUseCase.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

protocol PokemonDetailUseCase {
    
    var repository: PokemonRepository? { get }
    var delegate: PokemonDetailUseCaseDelegate? { get set }
    
    /// Get pokemon detail by id
    /// - Parameter path: Pokemon ID
    func getPokemonDetailBy(path: String)
}
