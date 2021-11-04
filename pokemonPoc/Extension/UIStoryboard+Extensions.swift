//
//  UIStoryboard+Extensions.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import UIKit

extension UIStoryboard {

    enum Storyboard: String {
        case Splash
    }
    
    convenience init(_ storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
}

