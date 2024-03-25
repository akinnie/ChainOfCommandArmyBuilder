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

    func testLoad_whereNoFileExists_shouldReturnDataMissingError() throws {
        // Arrange
        // Act
        let natResult = sut?.loadNationalities(fileName: "NotReallyAFile")

        // Assert
        guard case .failure(let error) = natResult else {
            XCTFail("Expected Error, got value instead")
            return
        }

        XCTAssertEqual(error as? DataError, DataError.dataMissingError)
    }

    func testLoad_whereDataExistsButEmpty_shouldReturnDataMissingError() throws {
        // Arrange
        // Act
        let natResult = sut?.loadNationalities(fileName: "EmptyData")

        // Assert
        guard case .failure(let error) = natResult else {
            XCTFail("Expected Error, got value instead")
            return
        }

        XCTAssertEqual(error as? DataError, DataError.dataMissingError)
    }
}
