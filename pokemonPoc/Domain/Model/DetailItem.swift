//
//  DetailItem.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation

enum DetailType {
    case unknow
    case image
    case stats
    case category
}

protocol DetailItem {
    var type: DetailType { get set }
}
