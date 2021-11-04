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
        
//        container.register(SplashUseCase.self) { resolver in
//            
//            guard let repository = resolver.resolve(CacheRepository.self) else {
//                fatalError("Assembler was unable to resolve CacheRepository")
//            }
//            guard let userRepository = resolver.resolve(UserRepository.self) else {
//                fatalError("Assembler was unable to resolve UserRepository")
//            }
//            
//            let useCase = SplashUseCaseDefault(sessionRepository: repository, userRepository: userRepository)
//            return useCase
//        }.inObjectScope(.transient)
    }
}
