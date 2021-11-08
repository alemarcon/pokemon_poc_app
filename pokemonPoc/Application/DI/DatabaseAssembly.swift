//
//  DatabaseAssembly.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 08/11/21.
//

import Foundation
import Swinject

class DatabaseAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(PokemonListRequestDB.self) { resolver in
            return PokemonListRequestDBDefault()
        }.inObjectScope(.transient)
        
    }
    
}
