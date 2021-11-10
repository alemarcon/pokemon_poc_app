//
//  PokemonDetailUseCaseIntegrationTest.swift
//  pokemonPocTests
//
//  Created by Alessandro Marcon on 10/11/21.
//

import Foundation
import Swinject
import XCTest
@testable import pokemonPoc

class PokemonDetailUseCaseIntegrationTest {
    
    private var expectation: XCTestExpectation
    private var xcTestCase: XCTestCase
    
    private var useCase: PokemonDetailUseCase?
    
    
    init(xcTestCase: XCTestCase) {
        // Initialize properties
        self.xcTestCase = xcTestCase
        expectation = XCTestExpectation(description: "...")
    }
    
    func runLoadPokemonDetailUseCase() {
        Assembler.type = .Test
        
        useCase = Assembler.sharedAssembler.resolver.resolve(PokemonDetailUseCase.self)
        useCase?.delegate = self
        useCase?.getPokemonDetailBy(path: "https://pokeapi.co/api/v2/pokemon/15")
        
        xcTestCase.wait(for: [expectation], timeout: 10.0)
    }
    
}

extension PokemonDetailUseCaseIntegrationTest: PokemonDetailUseCaseDelegate {
    
    func pokemonDetailsFound(detail: PokemonDetailModel) {
        XCTAssertTrue( detail.name == "beedrill" )
        XCTAssertTrue( detail.images.count == 4 )
        XCTAssertTrue( detail.images[0].type == .image )
        XCTAssertTrue( detail.stats.count == 6 )
        XCTAssertTrue( detail.stats[0].type == .stats )
        XCTAssertTrue( detail.stats[0].statName.lowercased() == "hp".lowercased() )
        XCTAssertTrue( detail.category.count == 2 )
        XCTAssertTrue( detail.category[0].type == .category )
        XCTAssertTrue( detail.category[0].name.lowercased() == "bug".lowercased() )
        expectation.fulfill()
    }
    
    func pokemonDetailsFail(error: CustomError) {
        XCTFail()
    }
    
}
