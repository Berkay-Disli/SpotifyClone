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
