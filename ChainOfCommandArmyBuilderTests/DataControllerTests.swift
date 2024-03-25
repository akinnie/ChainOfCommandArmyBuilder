//
//  DataControllerTests.swift
//  ChainOfCommandArmyBuilderTests
//
//  Created by Andrew Kinnie on 3/24/24.
//

import XCTest
@testable import ChainOfCommandArmyBuilder

final class DataControllerTests: XCTestCase {
    var sut: DataControllerProtocol?

    override func setUpWithError() throws {
        // Arrange
        sut = DataController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testDataControllerLoad_whereNoFileExists_shouldReturnError() throws {
        // Arrange
        // Act
        let natResult = sut?.loadNationalities(fileName: "NotReallyAFile")

        guard case .failure(let error) = natResult else {
            XCTFail("Expected Error, got value instead")
            return
        }

        // Assert
        XCTAssertEqual(error as? DataError, DataError.dataMissingError)
    }
}
