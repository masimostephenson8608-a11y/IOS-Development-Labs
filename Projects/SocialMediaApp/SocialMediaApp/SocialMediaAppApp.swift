//
//  SocialMediaAppApp.swift
//  SocialMediaApp
//
//  Created by Masimo Stephenson on 11/10/25.
//

import SwiftUI

@main
struct SocialMediaAppApp: App {
    let api = ApiService()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .onAppear() {
                    Task {
                        do {
//                            try await api.login("masimo.stephenson8608@stu.mtec.edu", "gawtij-kifzy2-depcEh")
                            
                            let testProfile = Profile(lastName: "", userUUID: "", userName: "Masimo Test", firstName: "", techInterests: "MY Interest", bio: "test bio")
//MARK: Testing Login functions
//                            try await api.updateProfile(userSecret: "27507300-D4E2-4E29-B4E2-C8BAADBC9CEA", profile: testProfile, secret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC")
                            
//                            try await api.getProfile(userUUID: "27507300-D4E2-4E29-B4E2-C8BAADBC9CEA", secret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC")
                            
//MARK: Testing Post Functions
//                            try await api.createPost(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC",
//                                                     postTitle: "Made for deletion",
//                                                     postBody: "Gonna delete.")
                            
//                            try await api.getPosts(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC", 0)
                            
//                            try await api.editPost(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC",
//                                                   postID: "176C1E9E-47BC-4ED9-9D17-06D7997AE40A",
//                                                   newTitle: "Editing this post",
//                                                   newBody: "This post has now been edited")
                            
//                            try await api.deletePost(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC",
//                                                     postID: "13550DEA-6044-4B0F-8366-C2000B914B6C")
                            
//                            try await api.toggleLike(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC", postID: "176C1E9E-47BC-4ED9-9D17-06D7997AE40A")
                            
 //MARK: Testing Comment Functions
//                            try await api.getComments(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC", postID: "176C1E9E-47BC-4ED9-9D17-06D7997AE40A", 1)
                            
//                            try await api.createComment(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC", postID: "176C1E9E-47BC-4ED9-9D17-06D7997AE40A", commentContent: "Testing to create comment")
                            
                            
                        } catch {
                            print("failed")
                        }
                    }
                }
        }
    }
}
