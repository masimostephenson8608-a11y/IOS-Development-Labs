//
//  MySpaceProfile.swift
//  SwiftUITextLab
//
//  Created by Jane Madsen on 9/10/25.
//

import SwiftUI

/*
 ## Instructions:
 Your goal is to create an app that will serve as social media profile. Use Text view modifiers to arrange and style your profile to reflect your unique style.
 
 Since this assignment will require you to choose custom fonts, you may want to open the Font Book app installed on your Mac, where you can view a list of the fonts available on Mac and iOS by default.
 
 If you would like to change the background color of each of these views, you can do so by changing the colors listed in each #Preview macro at the bottom of the page.
 
 1. Create three structs that conform to View: ProfileView, TopFiveFriendsView, and BlogPostView. This will fix the errors
 2. To see a preview of how each view will look in the app, make sure you have opened your canvas (Option + Command + Return). You can view each struct you've created by clicking on the tabs at the top of the canvas.
 3. Create a profile view with Text elements for each of the following items: Username, Real Name, Home City, and Bio. Style each of them appropriately with custom fonts, font sizes, and colors for each. Feel free to add any additional modifiers as well.
 4. Create a TopFiveFriends view with a list of your friends, ranked in order of favorite to least favorite. (Don't worry, we won't tell them). Use a different font and color for each person, and include an Emoji to represent each one as well.
 5. Create a BlogPostView. Write a long blog post. Give your blog post a title, a date posted, a body, and a display of number of likes and comments. Once again, style each individually with fonts, font sizes, and colors, and any other modifiers you would like.
 6. Try running the app. You should see all three views embedded in Tabs (the code for this is in SwiftUITextLabApp.swift). You may need to adjust the style slightly to accommodate the Tab Bar at the bottom of the screen.
 
 ## Black Diamond
 
 7. Add one or more Image views to each page.
 8. Use Stack views to arrange your content more dynamically.
 
 ## Rubric
 
 - App has a profile view with Username, Real Name, Home City, and Bio, appropriately filled out and styled.
 - App has a Top Five Friends screen with emoji, fonts, and colors for each friend.
 - App has a blog post view with a title, a date posted, a body, and a number of likes and comments. All are styled, sized, and colored appropriately.
 */

#Preview("ProfileView") {
    ProfileView()
        .background(.white)
}

#Preview("TopFiveFriendsView") {
    TopFiveFriendsView()
        .background(.white)
}

#Preview("BlogPostView") {
    BlogPostView()
        .background(.white)
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile View:")
                .font(.custom("Bodoni 72", size: 20))
            Text("Username:")
                .font(.custom("Bodoni 72", size: 20))
            Text("Real Name:")
                .font(.custom("Bodoni 72", size: 20))
            Text("Home City:")
                .font(.custom("Bodoni 72", size: 20))
            Text("Bio:")
                .font(.custom("Bodoni 72", size: 20))
            
        }
        //Username, Real Name, Home City, and Bio
    }
}

struct TopFiveFriendsView: View {
    var body: some View {
        VStack {
            Text("Ethan ✌🏿")
                .font(.caption)
                .foregroundStyle(.indigo)
                .background(.red)
            Text("Dillon🥲")
                .font(.caption)
                .foregroundStyle(.red)
                .background(.purple)
            Text("Makenna😉")
                .font(.caption)
                .foregroundStyle(.purple)
                .background(.green)
            
            Text("Bridger☠️")
                .font(.custom("Normal", size: 50))
                .foregroundStyle(.teal)
                .background(Gradient(colors: [.white, .purple, .black]))
                .containerShape(.capsule)
            
            Text("Spencer🏴‍☠️")
                .font(.caption)
                .foregroundStyle(.tertiary)
                .padding()
                .background(.teal)
                .containerShape(.capsule)
        }
    }
}

struct BlogPostView: View {
    var body: some View {
        VStack {
            Text("Vlog With my Friends")
            Text("Date: 09/23/25")
            Text("Me and my friends went to lagoon, each riding one roller coaster. I hate roller coasters so I was absolutely terrified and I didn't ride any after that one considering it made me feel sick. I do love Ski lifts though so I went on that for a while.")
                .foregroundStyle(Gradient(colors: [.red, .blue]))
                .padding(50)
                .background(in: .ellipse)
                .background(.black)
            Text("Likes: 23         Comments: 0")
        }
    }
}
