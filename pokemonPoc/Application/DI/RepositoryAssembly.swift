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

//        container.register(TrackRepository.self) { resolver in
//
//            guard let request = resolver.resolve(TrackRequest.self) else {
//                fatalError("Assembler was unable to resolve TrackRequest")
//            }
//            let repository = TrackRepositoryDefault(request: request)
//
//            return repository
//        }.inObjectScope(.transient)
    }
}
