//
//  PokemonListViewModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation
import Bond

protocol PokemonListViewModelInput {
    /// Load pokemon
    func loadPokemon()
    /// Load more pokemon (paginated query)
    func loadMorePokemon()
}

protocol PokemonListViewModelOutput {
    var status: Observable<PokemonListViewModelStatus> { get }
    var useCase: PokemonListUseCase? { get }
    var pokemonList: [PokemonItemModel]? { get }
    var errorMessage: String? { get }
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
    var errorMessage: String?
    
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
        errorMessage = error.localizedDescription
        status.value = .pokemonLoadingFail
    }
    
    func pokemonLoadingSuccess(pokemon: PokemonsModel) {
        LOGD("Success")
        errorMessage = nil
        self.pokemon = pokemon
        if( pokemonList == nil ) {
            self.pokemonList = [PokemonItemModel]()
        }
        
        for p in pokemon.pokemonList {
            if( !(pokemonList?.contains(where: { $0.id == p.id }) ?? false) ) {
                self.pokemonList?.append(p)
            }
        }
        status.value = .pokemonLoadingSuccess
    }
    
}
