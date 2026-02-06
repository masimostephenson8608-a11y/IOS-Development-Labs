//
//  ApiServiceCommentRoutes.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 2/6/26.
//

import Foundation
import SwiftUI
import Observation

extension ApiService {
    //MARK: Get Comments
    func getComments(userSecret: String, postID: String, _ pageNumber: Int? = nil) async throws -> [Comment] {
        
        /// pageNumbers 0 and 1 give the same result

        var components = URLComponents(string: "https://social-media-app.ryanplitt.com/post/\(postID)/comments")
        
        let queryItems = [
            URLQueryItem(name: "pagenumber", value: String(pageNumber ?? 1))
        ]
        
        components?.queryItems = queryItems
        
        guard let url = components?.url else { throw ApiError.failedToBuildBaseURL }
        
        do {
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(userSecret)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.failedHttpReponse
            }
            
            print(httpResponse.statusCode)
            if httpResponse.statusCode == 200 {
                let decoder = JSONDecoder()
                let results = try decoder.decode([Comment].self, from: data)
                print(results.count)
                print(results)
                return results
            } else {
                print(String(data: data, encoding: .utf8) ?? "No body")
                throw ApiError.failedURLSession
            }
        } catch {
            throw error
        }
    }
    
    //MARK: Create Comment
    func createComment(userSecret: String, postID: String, commentContent: String) async throws {
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/post/\(postID)/comments") else {
            throw ApiError.failedToBuildBaseURL
        }
        
        let body: [String : String] = [
            "postid" : postID,
            "userSecret" : userSecret,
            "comment" : commentContent
        ]
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let sendData = try jsonEncoder.encode(body)
            var request = URLRequest(url: baseUrl)
            
            request.httpMethod = "POST"
            request.httpBody = sendData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(userSecret)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.failedHttpReponse
            }
            
            print(httpResponse.statusCode)
            if httpResponse.statusCode != 200 {
                print(String(data: data, encoding: .utf8) ?? "No body")
                throw ApiError.failedURLSession
            }
        } catch {
            print(error)
        }
    }
}
