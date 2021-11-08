//
//  Assembler+Extension.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation
import Swinject

extension Assembler {
    
    static var type: AssemblerType = .Default
    
    static let sharedAssembler: Assembler = {
        let container = Container()
        
        let assembler = Assembler([
            ViewControllerAssembly(),
            ViewModelAssembly(),
            RepositoryAssembly(),
            UseCaseAssembly(),
            NetworkAssembly(),
            DatabaseAssembly()
        ], container: container)
        
        return assembler
    }()
}

enum AssemblerType {
    case Default
    case Test
}
