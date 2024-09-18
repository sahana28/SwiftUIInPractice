//
//  User.swift
//  
//
//  Created by Sahana  Rao on 04/09/24.
//

import Foundation



// MARK: - Welcome
struct UserList: Codable {
    let users: [User]
    let total, skip, limit: Int?
}

// MARK: - User
struct User : Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    
    var work : String {
        "Works at IT company"
    }
    
    var education : String {
        "Bachelor's in IT"
    }
    
    var about : String {
        "Its a section about me that is visible in the profile section."
    }
    
    var basics : [UserInterest] {
        [
        UserInterest( imageIcon: "ruler", emoji: nil, title: "\(height)"),
        UserInterest( imageIcon: "graduationcap", emoji: nil, title: education),
        UserInterest( imageIcon: "wineglass", emoji: nil, title: "Socially"),
        UserInterest( imageIcon: "moon.stars.fill", emoji: nil, title: "Virgo")
        ]
    }
    
    var interests : [UserInterest] {
        [
        UserInterest( imageIcon: nil, emoji: "👟", title: "Running"),
        UserInterest( imageIcon: nil, emoji: "🏋️‍♀️", title: "Gym"),
        UserInterest( imageIcon: nil, emoji: "🎧", title: "Music"),
        UserInterest( imageIcon: nil, emoji: "🥘", title: "Cooking")
        ]
    }
    
    var images : [String] {
        ["https://picsum.photos/400/500", "https://picsum.photos/600/600", "https://picsum.photos/500/400"]
    }
    
    static var mockUser : User {
        User(
            id: 1,
            firstName: "Sahana",
            lastName: "Rao",
            maidenName: "Sahana",
            age: 32,
            email: "dhd@gm.com",
            phone: "9930303",
            username: "smrao",
            password: "pass",
            birthDate: "",
            image: Constants.randomImageURL,
            bloodGroup: "",
            height: 34,
            weight: 58,
            eyeColor: "brown"
        )
    }
}

struct UserInterest : Identifiable{
    var id = UUID().uuidString
    var imageIcon : String?
    var emoji: String?
    var title : String
}

