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


enum UserSearchGrid: String, CaseIterable {
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
