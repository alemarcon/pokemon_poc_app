//
//  ViewControllerAssembly.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation
import Swinject

class ViewControllerAssembly: Assembly {
    
    enum ViewControllerIds: String {
        case splash_vc
    }
    
    func assemble(container: Container) {
        
        container.register(SplashViewController.self) { resolver in
            guard let controller: SplashViewController = UIStoryboard(.Splash).instantiateViewController(withIdentifier: ViewControllerIds.splash_vc.rawValue) as? SplashViewController else {
                fatalError("Assembler was unable to resolve SplashViewController")
            }
            return controller
        }.inObjectScope(.transient)
        
        container.register(PokemonListViewController.self) { resolver in
            guard let viewModel = resolver.resolve(PokemonListViewModel.self) else {
                fatalError("Assembler was unable to resolve PokemonListViewModel")
            }
            
            let controller = PokemonListViewController(viewModel: viewModel)
            
            return controller
        }.inObjectScope(.transient)
        
        container.register(PokemonDetailViewController.self) { (resolver, detailPath: String) in
            
            guard let viewModel = resolver.resolve(PokemonDetailViewModel.self, argument: detailPath) else {
                fatalError("Assembler was unable to resolve PokemonDetailViewModel")
            }
            
            let controller = PokemonDetailViewController(viewModel: viewModel)
            
            return controller
        }.inObjectScope(.transient)
    }
}
