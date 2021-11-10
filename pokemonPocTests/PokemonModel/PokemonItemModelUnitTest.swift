//
//  PokemonItemModelUnitTest.swift
//  pokemonPocTests
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation
import XCTest
@testable import pokemonPoc

class PokemonItemModelUnitTest {

    private var xcTestCase: XCTestCase
    
    
    init(xcTestCase: XCTestCase) {
        self.xcTestCase = xcTestCase
    }
    
    func testImageURL() {
        
        let POKEMON_ID = "15"
        let EXPECTED_IMAGE_URL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(POKEMON_ID).png"
        
        var item = PokemonItemModel()
        item.id = POKEMON_ID
        item.detailUrl = "https://pokeapi.co/api/v2/pokemon/15"
        item.name = "Pokemon test"
        
        XCTAssertTrue( item.getImageUrl()?.absoluteString == EXPECTED_IMAGE_URL )
    }
    
}
