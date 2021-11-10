//
//  PokemonDetailViewModel.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 09/11/21.
//

import Foundation
import Bond

protocol PokemonDetailViewModelInput {
    /// Load pokemon detail
    func loadPokemonDetail()
    func getPokemonName() -> String
}

protocol PokemonDetailViewModelOutput {
    var status: Observable<PokemonDetailViewModelStatus> { get }
    var useCase: PokemonDetailUseCase? { get }
    var detail: PokemonDetailModel? { get }
    var errorMessage: String? { get }
}

enum PokemonDetailViewModelStatus {
    case none
    case pokemonDetailLoading
    case pokemonDetailLoadingSuccess
    case pokemonDetailLoadingFail
}

protocol PokemonDetailViewModel: PokemonDetailViewModelInput, PokemonDetailViewModelOutput { }

class PokemonDetailViewModelDefault: PokemonDetailViewModel {
    
    var status: Observable<PokemonDetailViewModelStatus> = Observable(.none)
    var useCase: PokemonDetailUseCase?
    var detail: PokemonDetailModel?
    var errorMessage: String?
    private var detailPath: String
    
    init(useCase: PokemonDetailUseCase, detailPath: String) {
        self.useCase = useCase
        self.detailPath = detailPath
        self.useCase?.delegate = self
    }
    
    func loadPokemonDetail() {
        status.value = .pokemonDetailLoading
        useCase?.getPokemonDetailBy(path: detailPath)
    }
    
    func getPokemonName() -> String {
        guard let name = detail?.name else {
            return ""
        }
        
        return name.capitalized
    }
    
}

extension PokemonDetailViewModelDefault: PokemonDetailUseCaseDelegate {
    func pokemonDetailsFound(detail: PokemonDetailModel) {
        self.detail = detail
        errorMessage = nil
        status.value = .pokemonDetailLoadingSuccess
    }
    
    func pokemonDetailsFail(error: CustomError) {
        errorMessage = error.localizedDescription
        status.value = .pokemonDetailLoadingFail
    }
}
