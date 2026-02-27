//
//  APIController.swift
//  RandomUserAPI
//
//  Created by Masimo Stephenson on 2/25/26.
//

import Foundation

class APIController {
    let baseURL: String
    
    init() {
        self.baseURL = "https://randompeople.exnovo.app/api"
    }
    
    enum Gender: String {
        case male, female
    }
    
    func getUser(results: Int? = nil, gender: Gender? = nil) async throws  -> [User] {
        var components = URLComponents(string: baseURL)
        
        var urlQueries = [
            URLQueryItem(name: "results", value: String(results ?? 1))
        ]
        if let gender {
            urlQueries.append(URLQueryItem(name: "gender", value: gender.rawValue))
        }
        components?.queryItems = urlQueries
        
        do {
            guard let url = components?.url else { throw APIErrors.failedToBuildURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpReponse = response as? HTTPURLResponse else {
                throw APIErrors.CannotGetHttpResponse
            }
            
            print(httpReponse.statusCode)
            if httpReponse.statusCode == 200 {
                let decoder = JSONDecoder()
                let result = try decoder.decode(APIResponse.self, from: data)
                print(result)
                print(result.results)
                return result.results
            } else {
                throw APIErrors.not200response
            }
        } catch {
            print(error)
            throw error
        }
    }
    
    enum APIErrors: Error {
        case CannotBuildURL, CannotGetHttpResponse, not200response, failedToBuildURL
    }
}
