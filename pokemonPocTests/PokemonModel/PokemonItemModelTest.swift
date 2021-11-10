//
//  PokemonItemModelTest.swift
//  pokemonPocTests
//
//  Created by Alessandro Marcon on 10/11/21.
//

import XCTest
@testable import pokemonPoc

class PokemonItemModelTest: XCTestCase {

    func testPokemonItemModelURL() {
        let model = PokemonItemModelUnitTest(xcTestCase: self)
        model.testImageURL()
    }

}
