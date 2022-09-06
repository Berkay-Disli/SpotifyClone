//
//  Home.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI
import Kingfisher

struct Home: View {
    @ObservedObject var musicsVM: MusicsViewModel
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("bg"), .black, .black, .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                // MARK: Main Stack
                LazyVStack {
                    // Header
                    HStack {
                        Text("Hi there")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        ForEach(HeaderMenu.allCases, id: \.self) { item in
                            IconSmall(iconName: item.iconName)
                        }
                    }
                    .padding()
                    
                    // Header Playlists
                    LazyVGrid(columns: columns) {
                        ForEach(HeaderPlaylists.allCases, id:\.self) { item in
                            SmallGridItem(title: item.title, color: item.color, icon: item.icon)
                        }
                    }
                    .padding([.horizontal, .bottom])
                    
                    // Rock
                    VStack {
                        Text("Rock")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        if !musicsVM.genreSongs.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(musicsVM.genreSongs.prefix(5)) { item in
                                        LargeHStackItem(showArtist: true, title: item.trackName, artist: item.artistName, imageUrl: item.artworkUrl100)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 210)
                        .padding(.bottom)
                        } else {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: 210, alignment: .center)
                        }
                    }
                    .onAppear {
                        musicsVM.getSongs(searchType: .genre, term: "Rock", limit: 10)
                    }
                    
                    // For the fans
                    VStack {
                        HStack(spacing: 12) {
                            KFImage(URL(string: musicsVM.artistSongs.last?.artworkUrl60 ?? "https://via.placeholder.com/50"))
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading) {
                                Text("For the fans".uppercased())
                                    .font(.callout)
                                    .foregroundColor(Color(uiColor: .lightGray))
                                
                                Text("Blackfield")
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        
                        if !musicsVM.artistSongs.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(musicsVM.artistSongs.prefix(5)) { item in
                                        LargeHStackItem(showArtist: false, title: item.trackName, artist: "", imageUrl: item.artworkUrl100) // Change
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 185)
                            .padding(.bottom)
                        } else {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: 210, alignment: .center)
                                
                        }
                    }
                    .onAppear {
                        musicsVM.getSongs(searchType: .artist, term: "Blackfield", limit: 10)
                    }
                    
                    // Recently Played
                    VStack {
                        Text("Recently played")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(1...6, id:\.self) { item in
                                    MediumHStackItem()
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 185)
                        .padding(.bottom)
                    }
                    .padding(.bottom, 80)
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(musicsVM: MusicsViewModel())
    }
}
