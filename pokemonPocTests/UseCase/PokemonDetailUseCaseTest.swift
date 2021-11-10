//
//  PokemonDetailUseCaseTest.swift
//  pokemonPocTests
//
//  Created by Alessandro Marcon on 10/11/21.
//

import XCTest

class PokemonDetailUseCaseTest: XCTestCase {

    func testLoadPokemonDetail() throws {
        let detailTest = PokemonDetailUseCaseIntegrationTest(xcTestCase: self)
        detailTest.runLoadPokemonDetailUseCase()
    }

}
