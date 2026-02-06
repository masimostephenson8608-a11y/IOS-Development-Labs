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
    
    //MARK: Get Posts
    func getPosts(userSecret: String, _ pageNumber: Int? = nil) async throws -> [Post] {
        
        
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/posts/\(pageNumber ?? 0)")
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
                print("Posts: \(results.count)")
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
    
    //MARK: Create Post
    func createPost(userSecret: String, postTitle: String, postBody: String) async throws {
        
        struct MakeNewPost: Codable {
            let title: String
            let body: String
        }
        struct MakeNewPostBody: Codable {
            let userSecret: String
            let post: MakeNewPost
        }
        
        let newPost = MakeNewPost(title: postTitle, body: postBody)
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
    
    //MARK: Edit Post
    func editPost(userSecret: String, postID: String, newTitle: String, newBody: String) async throws {
        
        struct MakeNewPost: Codable {
            let title: String
            let body: String
        }
        struct MakeNewPostBody: Codable {
            let userSecret: String
            let post: MakeNewPost
        }
        
        let newPost = MakeNewPost(title: newTitle, body: newBody)
        let newPostBody = MakeNewPostBody(userSecret: userSecret, post: newPost)
        
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/post/edit/\(postID)")
        else { throw ApiError.failedToBuildBaseURL }
        
        let body = newPostBody
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let sendData = try jsonEncoder.encode(body)
            var request = URLRequest(url: baseUrl)
            
            request.httpMethod = "POST"
            request.httpBody = sendData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(userSecret)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else { throw ApiError.failedHttpReponse }
            
            print(httpResponse.statusCode)
            if httpResponse.statusCode != 200 {
                print(String(data: data, encoding: .utf8) ?? "No body")
            }
        } catch {
            print(error)
        }
    }
    
    //MARK: Delete Post
    func deletePost(userSecret: String, postID: String) async throws {
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/post/\(postID)")
            else { throw ApiError.failedToBuildBaseURL }
        
        do {
            var request = URLRequest(url: baseUrl)
            
            request.httpMethod = "DELETE"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(userSecret)", forHTTPHeaderField: "Authorization")
            
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
    
    //MARK: Toggle Like Post
    func toggleLike(userSecret: String, postID: String) async throws {
        guard let baseUrl = URL(string: "https://social-media-app.ryanplitt.com/post/\(postID)/like")
        else { throw ApiError.failedToBuildBaseURL }
        
        let body: [String : String] = [
            "userSecret" : userSecret
        ]
        
        let encoder = JSONEncoder()
        
        do {
            let sendData = try encoder.encode(body)
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
            throw error
        }
    }
}
