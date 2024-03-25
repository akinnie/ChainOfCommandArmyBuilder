//
//  DataController.swift
//  ChainOfCommandArmyBuilder
//
//  Created by Andrew Kinnie on 3/24/24.
//

import Foundation

enum DataError: Error {
    case parseError, dataMissingError
}

protocol DataControllerProtocol {
    func loadNationalities(fileName: String) -> Result<[Nationality], Error>
}

struct DataController: DataControllerProtocol {
    static let shared = DataController()
    func loadNationalities(fileName: String = "DefaultData") -> Result<[Nationality], Error> {
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let nationalities = try decoder.decode([Nationality].self, from: data)
                return .success(nationalities)
            } catch let error {
                print(error)
                return .failure(DataError.parseError)
            }
        }

        return .failure(DataError.dataMissingError)
    }
}
