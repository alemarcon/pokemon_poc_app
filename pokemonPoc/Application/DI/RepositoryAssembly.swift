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
            
            guard let dbRequest = resolver.resolve(PokemonListRequestDB.self) else {
                fatalError("Assembler was unable to resolve PokemonListRequestDB")
            }
            
            let repository = PokemonRepositoryDefault(request: request, dbRequest: dbRequest)

            return repository
        }.inObjectScope(.transient)
    }
}
