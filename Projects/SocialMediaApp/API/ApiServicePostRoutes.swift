//
//  ApiServicePostRoutes.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 2/4/26.
//
import Foundation
import SwiftUI
import Observation

extension ApiService {
    
    //MARK: getPosts
    func getPosts(userSecret: String) async throws -> [Post] {
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/posts")
        else { throw ApiError.failedToBuildBaseURL }
        
        do {
            var request = URLRequest(url: baseUrl)
            
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(userSecret)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse
                    else { throw ApiError.failedURLSession}
            
            if httpResponse.statusCode == 200 {
                let decoder = JSONDecoder()
                let results = try decoder.decode([Post].self, from: data)
                print(results)
                return results
            } else {
                print(httpResponse.statusCode)
                print(String(data: data, encoding: .utf8) ?? "No body")
            }
        } catch {
            print(error)
        }
        return []
    }
    
    func createPost(userSecret: String, post: Post) async throws {
        
        struct MakeNewPost: Codable {
            let title: String
            let body: String
        }
        struct MakeNewPostBody: Codable {
            let userSecret: String
            let post: MakeNewPost
        }
        
        let newPost = MakeNewPost(title: post.id, body: post.body)
        let newPostBody = MakeNewPostBody(userSecret: userSecret, post: newPost)
        
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/post")
                else { throw ApiError.failedURLSession }
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let sendData = try jsonEncoder.encode(newPostBody)
            var request = URLRequest(url: baseUrl)
            
            request.httpMethod = "POST"
            request.httpBody = sendData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(userSecret)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.failedURLSession
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
