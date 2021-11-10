//
//  PokemonListUseCaseTest.swift
//  pokemonPocTests
//
//  Created by Alessandro Marcon on 10/11/21.
//

import XCTest

class PokemonListUseCaseTest: XCTestCase {

    func testLoadPokemonListTest() throws {
        let listTest = PokemonListUseCaseIntegrationTest(xcTestCase: self)
        listTest.runLoadPokemonListUseCase()
    }

}
