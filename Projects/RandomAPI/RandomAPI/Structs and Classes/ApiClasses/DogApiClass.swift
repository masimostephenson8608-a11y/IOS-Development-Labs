//
//  ApiClass.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/20/25.
//

import Foundation
import Observation


enum errors: Error {
    case buildingURL, getDogDataFunction
}

protocol DogApiProtocol {
    func getDogData() async throws -> Dog
}

@Observable
class DogAPI: DogApiProtocol {
    func getDogData() async throws -> Dog {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            throw errors.buildingURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                
                let decoder = JSONDecoder()
                let json = try decoder.decode(Dog.self, from: data)
                print(json)
                return json
            }
        }
        throw errors.getDogDataFunction
    }
}
