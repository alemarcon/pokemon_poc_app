//
//  SplashViewController.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import UIKit
import Swinject

class SplashViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Added 0.5 seconds of delay just to show splash screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loadMainView()
        }
        
    }
    
    /// Load main view controller
    fileprivate func loadMainView() {
        guard let controller = Assembler.sharedAssembler.resolver.resolve(PokemonListViewController.self) else {
            LOGE("Unable to resolve PokemonListViewController")
            return
        }
        
        let nvc: UINavigationController = UINavigationController(rootViewController: controller)
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = nvc
    }
}
