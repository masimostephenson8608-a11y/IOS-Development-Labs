//
//  ApiService.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 1/29/26.
//
import Foundation
import SwiftUI
import Observation

@Observable
class ApiService: ApiServiceProtocol {
    
    enum ApiError: Error {
        case failedToBuildBaseURL, errorConvertingDatatoJSON, serverError, wholeFunctionFailed
        case failedHttpReponse
        case failedURLSession
        case failedToEncodeData
    }
    
    //MARK: Login Function
    func login(_ email: String, _ password: String) async throws -> signInResponse {
        // Creating Base URL
        guard let url = URL(string:"https://social-media-app.ryanplitt.com/auth/login") else {
            throw ApiError.failedToBuildBaseURL
        }
        
        // Making data that is ready to be converted into JSON
        let postData: [String:String] = [
            "email" : email,
            "password" : password
        ]
        
        let jsonEncoder = JSONEncoder()
        
        do {
            // Converting Data to JSON
            let beginData = try jsonEncoder.encode(postData)
            // MAKING REQUEST AND BUILDING THE BODY
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            request.httpBody = beginData
            
            // Setting header for URL request
            request.addValue("application/json", forHTTPHeaderField: "Content-type")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else { throw ApiError.serverError }
            
            if httpResponse.statusCode == 200 {
                let decoder = JSONDecoder()
                let results = try decoder.decode(signInResponse.self, from: data)
                print(results)
                return results
            } else {
                print("http response: \(httpResponse.statusCode)")
                print(String(data: data, encoding: .utf8) ?? "No body")
                throw ApiError.serverError
            }
            
        } catch {
            print(error)
        }
        throw ApiError.wholeFunctionFailed
    }
    
    // MARK: Fetching Profile
    func getProfile(userUUID: String, secret: String) async throws -> Profile {
        guard let baseURL = URL(string: "https://social-media-app.ryanplitt.com/user/\(userUUID)") else {
            throw ApiError.failedToBuildBaseURL
        }
        
        do {
            var request = URLRequest(url: baseURL)
            
            request.httpMethod = "GET"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(secret)", forHTTPHeaderField: "Authorization")
            
            let (responseData, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else { throw ApiError.failedHttpReponse }
            
            if httpResponse.statusCode == 200 {
                let decoder = JSONDecoder()
                let results = try decoder.decode(Profile.self, from: responseData)
                print(results)
                return results
            } else {
                print(httpResponse.statusCode)
                print(String(data: responseData, encoding: .utf8) ?? "No body")
                throw ApiError.serverError
            }
        } catch {
            print(error)
            throw error
        }
    }
    
    //MARK: Update Profile
    func updateProfile(userSecret: String, profile: Profile, secret: String) async throws {
        struct UpdateProfile: Codable {
            let userName: String
            let bio: String
            let techInterests: String
        }
        
        struct UpdateProfileBody: Codable {
            let userSecret: String
            let profile: UpdateProfile
        }
        
        let bodyProfile = UpdateProfile(userName: profile.userName,
                                        bio: profile.bio,
                                        techInterests: profile.techInterests)
        
        let finishedBody = UpdateProfileBody(userSecret: userSecret,
                                             profile: bodyProfile)
        
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/user/update-profile") else {
            throw ApiError.failedToBuildBaseURL
        }
        
        //            let body: [String : UpdateProfileBody] = [
        //
        //            ]
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let sendData = try jsonEncoder.encode(finishedBody)
            var request = URLRequest(url: baseUrl)
            
            request.httpMethod = "POST"
            request.httpBody = sendData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(secret)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.failedHttpReponse
            }
            
            print(httpResponse.statusCode)
            if httpResponse.statusCode != 200 {
                print(String(data: data, encoding: .utf8) ?? "No body")
            }
        } catch {
            print(error)
        }
        
    }
}
