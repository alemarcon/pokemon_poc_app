//
//  PokemonDetailUseCaseDefault.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation

class PokemonDetailUseCaseDefault: PokemonDetailUseCase {
    var repository: PokemonRepository?
    var delegate: PokemonDetailUseCaseDelegate?
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
    
    func getPokemonDetailBy(path: String) {
        repository?.getPokemonDetail(path: path, success: { pokemonDetail in
            self.delegate?.pokemonDetailsFound(detail: pokemonDetail)
        }, failure: { error in
            self.delegate?.pokemonDetailsFail(error: error)
        })
    }
}
