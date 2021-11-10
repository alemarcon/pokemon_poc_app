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
    
    func getPokemonDetailBy(path: String)
}
