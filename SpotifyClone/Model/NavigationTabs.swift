//
//  NavigationTabs.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import Foundation

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
