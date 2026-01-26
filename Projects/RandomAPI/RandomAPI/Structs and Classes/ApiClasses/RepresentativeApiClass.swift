//
//  RepresentativeApiClass.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/21/25.
//

import Foundation

protocol RepresentativeApiControllerProtocol {
    func fetchRepresentatives(zip: String) async throws -> [Representative]
}

class RepresentativeApiController: RepresentativeApiControllerProtocol {
    //https://whoismyrepresentative.com/getall_mems.php?zip=84045&output=json
    func fetchRepresentatives(zip: String) async throws -> [Representative] {
        let baseUrl = "https://whoismyrepresentative.com/getall_mems.php"
        
        var components = URLComponents(string: baseUrl)
        
        let queryItems = [
            URLQueryItem(name: "zip", value: zip),
            URLQueryItem(name: "output", value: "json")
        ]
        components?.queryItems = queryItems
        
        
                
        do {
            guard let url = components?.url else { throw errors.buildingURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                
                let decoder = JSONDecoder()
                let results = try decoder.decode(Results.self, from: data)
                print(results)
                return results.results
            }
        }
        throw errors.buildingURL
    }
}

class StubRepApiController: RepresentativeApiControllerProtocol {
    
    enum FakeError: Error {
        case testThrow
    }
    
    func fetchRepresentatives(zip: String) async throws -> [Representative] {
        if zip == "11111" {
            throw FakeError.testThrow
        } else {
            let results = [
                Representative(name: "Test1", party: "Rep", state: "Utah", district: "Yes", phone: "3333", office: "No", link: "Yes"),
                //            Representative(name: "Test2", party: "Rep", state: "Utah", district: "Yes", phone: "3333", office: "No", link: "Yes"),
                //            Representative(name: "Test3", party: "Rep", state: "Utah", district: "Yes", phone: "3333", office: "No", link: "Yes")
            ]
            return results
        }
    }
}
