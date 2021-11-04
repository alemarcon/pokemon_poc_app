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
        
//        container.register(SplashViewModel.self) { resolver in
//            
//            guard let useCase = resolver.resolve(SplashUseCase.self) else {
//                fatalError("Assembler was unable to resolve SplashUseCaseDefault")
//            }
//            
//            let viewModel = SplashViewModelDefault(useCase: useCase)
//
//            return viewModel
//        }.inObjectScope(.transient)
    }
}
