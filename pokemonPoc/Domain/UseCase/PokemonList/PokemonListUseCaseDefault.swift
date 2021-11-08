//
//  PokemonListUseCaseDefault.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation

class PokemonListUseCaseDefault: PokemonListUseCase {
    
    var repository: PokemonRepository?
    var delegate: PokemonListUseCaseDelegate?
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
    
    func loadPokemons(offset: String) {
        repository?.getPokemons(offset: offset, success: { pokemon in
            self.delegate?.pokemonLoadingSuccess(pokemon: pokemon)
        }, failure: { error in
            self.delegate?.pokemonLoadingFails(error: error)
        })
    }
    
    
}
