//
//  MusicsViewModel.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import Foundation
import Alamofire

class MusicsViewModel: ObservableObject {
    @Published var genreSongs = [Result]()
    @Published var artistSongs = [Result]()
    @Published var searchedNameSongs = [Result]()
    @Published var generalSearchResults = [Result]()
    
    init() {

    }
    
    func getSongs(searchType: SearchType, term: String, limit: Int) {
        switch searchType {
        case .genre:
            let url = "https://itunes.apple.com/search?term=\(term)&entity=song&attribute=genreIndex&limit=\(limit)"
            
            AF.request(url, method: .get).responseDecodable(of: Music.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async { [weak self] in
                        self?.genreSongs = data.results
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
        case .artist:
            let url = "https://itunes.apple.com/search?term=\(term.lowercased())&entity=song&attribute=artistTerm&limit=\(limit)"
            
            AF.request(url, method: .get).responseDecodable(of: Music.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async { [weak self] in
                        self?.artistSongs = data.results
                    }
                case .failure(let error):
                    print(error)
                }
            }
        
        case .songName:
            let url = "https://itunes.apple.com/search?term=\(term.lowercased())&entity=song&attribute=songTerm&limit=\(limit)"
            
            AF.request(url, method: .get).responseDecodable(of: Music.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async { [weak self] in
                        self?.searchedNameSongs = data.results
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
        case .generalSearch:
            let url = "https://itunes.apple.com/search?term=\(term.lowercased())&entity=song&limit=\(limit)"
            
            AF.request(url, method: .get).responseDecodable(of: Music.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async { [weak self] in
                        self?.generalSearchResults = data.results
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
