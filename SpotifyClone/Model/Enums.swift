//
//  Enums.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import Foundation
import SwiftUI

enum HeaderMenu: CaseIterable {
    case notifications, history, settings
    
    var iconName: String {
        switch self {
        case .notifications:
            return "bell"
        case .history:
            return "clock.arrow.circlepath"
        case .settings:
            return "gearshape"
        }
    }
}

enum HeaderPlaylists: CaseIterable {
    case favourites, explore, myPlaylist1, myPlaylist2
    
    var title: String {
        switch self {
        case .favourites:
            return "Favourites"
        case .explore:
            return "Explore"
        case .myPlaylist1:
            return "My Playlist 1"
        case .myPlaylist2:
            return "My Playlist 2"
        }
    }
    var icon: String {
        switch self {
        case .favourites:
            return "heart"
        case .explore:
            return "magnifyingglass"
        case .myPlaylist1:
            return "face.smiling.fill"
        case .myPlaylist2:
            return "hand.thumbsup"
        }
    }
    
    var color: Color {
        switch self {
        case .favourites:
            return .pink
        case .explore:
            return .purple
        case .myPlaylist1:
            return .orange
        case .myPlaylist2:
            return .green
        }
    }
}

enum Tabs: CaseIterable {
    case home, search, library
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .library:
            return "Library"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "music.note.house"
        case .search:
            return "magnifyingglass.circle"
        case .library:
            return "list.bullet.rectangle.portrait"
        }
    }
}


enum UserFavouriteGenres: String, CaseIterable {
    case rock, hiphop, pop, indie
    
    var title: String {
        switch self {
        case .rock:
            return "Rock"
        case .hiphop:
            return "Hiphop"
        case .pop:
            return "Pop"
        case .indie:
            return "Indie"
        }
    }
}

enum AllGenres: String, CaseIterable {
    case podcasts, forYou, lists, new, radio, explore
    case live, summer, popular, mood, seasonal, danceAndElectronic
    case chill, travel, focus, fitness, romance, sleep
    case classical, jazz, home, games, party, rNb
    case movies, kpop, alternative, blues, soul, health
    case metal, country, latin, cooking, comedy, funk, acoustic, children
    case punk, instrumental, ambient, freshFinds
    
    // I could just use the rawValues. But here we are, you and me.
    var title: String {
        switch self {
        case .podcasts:
            return "Podcasts"
        case .forYou:
            return "For you"
        case .lists:
            return "Lists"
        case .new:
            return "New"
        case .radio:
            return "Radio"
        case .explore:
            return "Explore"
        case .live:
            return "Live"
        case .summer:
            return "Summer"
        case .popular:
            return "Popular"
        case .mood:
            return "Mood"
        case .seasonal:
            return "Seosonal"
        case .danceAndElectronic:
            return "Dance and Electronics"
        case .chill:
            return "Chill"
        case .travel:
            return "Travel"
        case .focus:
            return "Focus"
        case .fitness:
            return "Fitness"
        case .romance:
            return "Romance"
        case .sleep:
            return "Sleep"
        case .classical:
            return "Classical"
        case .jazz:
            return "Jazz"
        case .home:
            return "Home"
        case .games:
            return "Games"
        case .party:
            return "Party"
        case .rNb:
            return "RnB"
        case .movies:
            return "Movies"
        case .kpop:
            return "K-Pop"
        case .alternative:
            return "Alternative"
        case .blues:
            return "Blues"
        case .soul:
            return "Soul"
        case .health:
            return "Health"
        case .metal:
            return "Metal"
        case .country:
            return "Country"
        case .latin:
            return "Latin"
        case .cooking:
            return "Cooking"
        case .comedy:
            return "Comedy"
        case .funk:
            return "Funk"
        case .acoustic:
            return "Acoustic"
        case .children:
            return "Children"
        case .punk:
            return "Punk"
        case .instrumental:
            return "Instrumental"
        case .ambient:
            return "Ambient"
        case .freshFinds:
            return "FreshFinds"
        }
    }
}
