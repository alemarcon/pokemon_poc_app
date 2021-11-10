//
//  ViewModelAssembly.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(PokemonListViewModel.self) { resolver in
            
            guard let useCase = resolver.resolve(PokemonListUseCase.self) else {
                fatalError("Assembler was unable to resolve PokemonListUseCase")
            }
            
            let viewModel = PokemonListViewModelDefault(useCase: useCase)

            return viewModel
        }.inObjectScope(.transient)
        
        container.register(PokemonDetailViewModel.self) { (resolver, path: String) in
            
            guard let useCase = resolver.resolve(PokemonDetailUseCase.self) else {
                fatalError("Assembler was unable to resolve PokemonDetailUseCase")
            }
            
            let viewModel = PokemonDetailViewModelDefault(useCase: useCase, detailPath: path)

            return viewModel
        }.inObjectScope(.transient)
    }
}
