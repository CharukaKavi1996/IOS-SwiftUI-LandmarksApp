//
//  Profile.swift
//  Landmarks
//
//  Created by Charuka on 2025-04-03.
//

import Foundation

struct Profile {
    
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "Charuka kavinda")
    
    enum season: String, CaseIterable, Identifiable{
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id:String{rawValue}
    }
}
