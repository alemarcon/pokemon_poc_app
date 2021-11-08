//
//  UseCaseAssembly.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation
import Swinject

class UseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(PokemonListUseCase.self) { resolver in
            
            guard let repository = resolver.resolve(PokemonRepository.self) else {
                fatalError("Assembler was unable to resolve PokemonRepository")
            }
            
            let useCase = PokemonListUseCaseDefault(repository: repository)
            return useCase
        }.inObjectScope(.transient)
    }
}
