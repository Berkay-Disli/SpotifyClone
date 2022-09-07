//
//  Music.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import Foundation

// MARK: - Music
struct Music: Identifiable, Codable {
    let id = UUID().uuidString
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Identifiable, Codable {
    let id = UUID().uuidString
    let artistId, collectionId, trackId: Int
    let artistName, collectionName, trackName: String
    let previewUrl: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let releaseDate: String
    let primaryGenreName: String
}

enum SearchType: String {
    case genre, artist, songName
    case generalSearch
}
