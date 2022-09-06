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
    
    init() {
        
    }
    
    func getSongs(searchType: SearchType, term: String, limit: Int) {
        switch searchType {
        case .genre:
            let url = "https://itunes.apple.com/search?term=\(term)&entity=song&attribute=genreIndex&limit=\(limit)"
            
            AF.request(url, method: .get).responseDecodable(of: Music.self) { response in
                switch response.result {
                case .success(let data):
                    print("\n\n MARK: SUCCESS \n\n")
                    DispatchQueue.main.async { [weak self] in
                        self?.genreSongs = data.results
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
        case .artist:
            let url = "https://itunes.apple.com/search?term=\(term)&entity=song&attribute=artistTerm&limit=\(limit)"
            
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
        }
    }
}
