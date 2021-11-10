//
//  PokemonListUseCaseIntegrationTest.swift
//  pokemonPocTests
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation
import Swinject
import XCTest
@testable import pokemonPoc

class PokemonListUseCaseIntegrationTest {
    
    private var expectation: XCTestExpectation
    private var xcTestCase: XCTestCase
    
    private var useCase: PokemonListUseCase?
    
    
    init(xcTestCase: XCTestCase) {
        // Initialize properties
        self.xcTestCase = xcTestCase
        expectation = XCTestExpectation(description: "...")
    }
    
    func runLoadPokemonListUseCase() {
        Assembler.type = .Test
        
        useCase = Assembler.sharedAssembler.resolver.resolve(PokemonListUseCase.self)
        useCase?.delegate = self
        useCase?.loadPokemons(offset: "0")
        
        xcTestCase.wait(for: [expectation], timeout: 10.0)
    }
    
}

extension PokemonListUseCaseIntegrationTest: PokemonListUseCaseDelegate {
    
    func pokemonLoadingFails(error: CustomError) {
        XCTFail()
    }
    
    func pokemonLoadingSuccess(pokemon: PokemonsModel) {
        XCTAssertTrue( pokemon.previous == nil )
        XCTAssertTrue( pokemon.next == "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20" )
        XCTAssertTrue( pokemon.count == 1118 )
        XCTAssertTrue( pokemon.pokemonList.count == 20 )
        XCTAssertTrue( pokemon.pokemonList[0].name == "bulbasaur" )
        XCTAssertTrue( pokemon.pokemonList[0].detailUrl == "https://pokeapi.co/api/v2/pokemon/1/" )
        XCTAssertTrue( pokemon.pokemonList[0].getImageUrl()?.absoluteString == "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png" )
        XCTAssertTrue( pokemon.pokemonList[19].name == "raticate" )
        XCTAssertTrue( pokemon.pokemonList[19].detailUrl == "https://pokeapi.co/api/v2/pokemon/20/" )
        XCTAssertTrue( pokemon.pokemonList[19].getImageUrl()?.absoluteString == "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png" )
        expectation.fulfill()
    }
    
}
