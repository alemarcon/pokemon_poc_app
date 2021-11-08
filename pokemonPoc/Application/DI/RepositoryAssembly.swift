//
//  RepositoryAssembly.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {

        container.register(PokemonRepository.self) { resolver in

            guard let request = resolver.resolve(PokemonRequest.self) else {
                fatalError("Assembler was unable to resolve PokemonRequest")
            }
            let repository = PokemonRepositoryDefault(request: request)

            return repository
        }.inObjectScope(.transient)
    }
}
