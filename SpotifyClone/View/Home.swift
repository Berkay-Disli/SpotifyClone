//
//  Home.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct Home: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .black, .black, .black],
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
                            SmallGridItem(title: item.title, color: item.color)
                        }
                    }
                    .padding([.horizontal, .bottom])
                    
                    // Keep Listening
                    VStack {
                        Text("Keep listening")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(1...6, id:\.self) { item in
                                    LargeHStackItem(showArtist: true)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 210)
                        .padding(.bottom)
                    }
                    
                    // For the fans
                    VStack {
                        HStack(spacing: 12) {
                            Circle().fill(.gray)
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
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(1...6, id:\.self) { item in
                                    LargeHStackItem(showArtist: false)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 185)
                        .padding(.bottom)
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
                    .padding(.bottom, 66)
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
