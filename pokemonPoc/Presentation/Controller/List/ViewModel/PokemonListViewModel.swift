//
//  PokemonListViewModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation
import Bond

protocol PokemonListViewModelInput {
    /// Logout current user
    func loadPokemon()
    func loadMorePokemon()
}

protocol PokemonListViewModelOutput {
    var status: Observable<PokemonListViewModelStatus> { get }
    var useCase: PokemonListUseCase? { get }
    var pokemonList: [PokemonItemModel]? { get }
}

enum PokemonListViewModelStatus {
    case none
    case pokemonLoading
    case pokemonLoadingSuccess
    case pokemonLoadingFail
}

protocol PokemonListViewModel: PokemonListViewModelInput, PokemonListViewModelOutput { }

class PokemonListViewModelDefault: PokemonListViewModel {
    var status: Observable<PokemonListViewModelStatus> = Observable(.none)
    var useCase: PokemonListUseCase?
    var pokemonList: [PokemonItemModel]?
    
    private var pokemon: PokemonsModel?
    private var offset: Int = 0
    
    init(useCase: PokemonListUseCase) {
        self.useCase = useCase
        self.useCase?.delegate = self
    }
    
    func loadPokemon() {
        status.value = .pokemonLoading
        useCase?.loadPokemons(offset: String(offset))
    }
    
    func loadMorePokemon() {
        if( pokemon?.next != nil && status.value != .pokemonLoading ) {
            status.value = .pokemonLoading
            offset = offset + 20
            useCase?.loadPokemons(offset: String(offset))
        }
    }
}

extension PokemonListViewModelDefault: PokemonListUseCaseDelegate {
    
    func pokemonLoadingFails(error: CustomError) {
        LOGE("Error")
        status.value = .pokemonLoadingFail
    }
    
    func pokemonLoadingSuccess(pokemon: PokemonsModel) {
        LOGD("Success")
        self.pokemon = pokemon
        if( pokemonList == nil ) {
            self.pokemonList = [PokemonItemModel]()
        }
        self.pokemonList?.append(contentsOf: pokemon.pokemonList)
        status.value = .pokemonLoadingSuccess
    }
    
}
