//
//  NetworkAssembly.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation
import Swinject

class NetworkAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(PokemonRequest.self) { resolver in
            return PokemonRequestDefault()
        }.inObjectScope(.transient)
        
    }
    
}
