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
//                            try await api.updateProfile(userSecret: "27507300-D4E2-4E29-B4E2-C8BAADBC9CEA", profile: testProfile, secret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC")
                            
//                            try await api.getProfile(userUUID: "27507300-D4E2-4E29-B4E2-C8BAADBC9CEA", secret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC")
                            
//                            try await api.createPost(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC", post: Post(title: "Testing Making Posts", body: "I will run this test now.") )
                            
//                            try await api.getPosts(userSecret: "BBC5E3E0-EB4C-469A-90E7-745D8CFAB2CC")
                        } catch {
                            print("failed")
                        }
                    }
                }
        }
    }
}
