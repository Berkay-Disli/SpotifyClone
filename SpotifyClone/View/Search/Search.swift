//
//  Search.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct Search: View {
    @State private var searchText = ""
    @ObservedObject var musicsVM: MusicsViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.black.ignoresSafeArea()
                
                // MARK: Main Stack
                VStack {
                    // Sticky Header
                    VStack {
                        Text("Search")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading, .top])
                            .padding(.bottom, -0.01) // SwiftUI beta bug-fix
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.title3)
                                .foregroundColor(.gray)
                            
                            TextField("", text: $searchText)
                                .placeholder(when: searchText.isEmpty) {
                                    Text("Artists or songs")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(uiColor: .darkGray))
                                }
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(.white)
                        .padding(.horizontal)
                    }
                    
                    
                    if searchText.isEmpty {
                        SearchCategoriesSubView()
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    } else {
                        if searchText.count > 2 {
                            ScrollView {
                                LazyVStack(spacing: 12) {
                                    ForEach(musicsVM.generalSearchResults) { item in
                                        SearchResultItem(trackName: item.trackName, artistName: item.artistName, imageUrl: item.artworkUrl60)
                                    }
                                }
                                .padding(.bottom, 85)
                            }
                            .padding(.horizontal)
                            .transition(AnyTransition.opacity.animation(.easeInOut))
                            .onAppear {
                                musicsVM.getSongs(searchType: .generalSearch, term: searchText, limit: 20)
                            }
                            .onChange(of: searchText) { newTerm in
                                musicsVM.getSongs(searchType: .generalSearch, term: newTerm, limit: 20)
                            }
                        } else {
                            VStack {
                                Spacer()
                                Text("Searching for:")
                                    .font(.largeTitle)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        .transition(AnyTransition.opacity.animation(.easeInOut))
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(musicsVM: MusicsViewModel())
    }
}


extension View {
    func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
