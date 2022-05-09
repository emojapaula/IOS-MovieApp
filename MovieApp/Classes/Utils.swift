//
//  Utils.swift
//  MovieApp
//
//  Created by Paula on 16.04.2022..
//

import Foundation
import UIKit
import MovieAppData

class Utils {
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

   static func groupToString(group: MovieGroup) -> String {
        switch group{
        case .popular:
            return "Popular"
        case .freeToWatch:
            return "Free To Watch"
        case .trending:
            return "Trending"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        }
    }
    
   static func genreToString(genre: Genre) -> String {
        switch genre{
        case .thriller:
            return "Thriller"
        case .horror:
            return "Horror"
        case .comedy:
            return "Comedy"
        case .romanticComedy:
            return "Romantic Comedy"
        case .sport:
            return "Sport"
        case .action:
            return "Action"
        case .sciFi:
            return "Sci-Fi"
        case .war:
            return "War"
        case .drama:
            return "Drama"

    }
    }
    
    
    //I notice how filters declared here are not the same as filters declared in Figma, but right now it is 10 PM on Easter
    //so I don't want to ask questions on Teams, and I think that this is a better solution than hardcoding items
   static  func filterToString(filter: MovieFilter) -> String{
        switch filter{
        case .drama:
            return "Drama"
        case .streaming:
            return "Streaming"
        case .onTv:
            return "On TV"
        case .forRent:
            return "For Rent"
        case .inTheaters:
            return "In theaters"
        case .thriller:
            return "Thriller"
        case .horror:
            return "Horror"
        case .comedy:
            return "Comedy"
        case .romanticComedy:
            return "Romantic Comedy"
        case .sport:
            return "Sport"
        case .action:
            return "Action"
        case .sciFi:
            return "Sci-Fi"
        case .war:
            return "War"
        case .day:
            return "Day"
        case .week:
            return "Week"
        case .month:
            return "Month"
        case .allTime:
            return "All Time"
        }
    }
}
