//
//  Search.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct Search: View {
    @State private var searchText = ""
    let userColumns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
    let colors: [Color] = [.purple, .orange, .red, .green, .pink, .blue, .brown]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
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
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(.white)
                    .padding([.horizontal, .bottom])
                    
                    LazyVStack {
                        // Your favourites
                        VStack(alignment: .leading) {
                            Text("Your favourite genres")
                                .fontWeight(.medium)
                            
                            LazyVGrid(columns: userColumns) {
                                ForEach(UserFavouriteGenres.allCases, id:\.self) { item in
                                    LargeGridItem(title: item.title, color: self.colors.randomElement() ?? .black)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                    
                    LazyVStack {
                        // Your favourites
                        VStack(alignment: .leading) {
                            Text("Explore all")
                                .fontWeight(.medium)
                            
                            LazyVGrid(columns: userColumns) {
                                ForEach(AllGenres.allCases, id:\.self) { item in
                                    LargeGridItem(title: item.title, color: self.colors.randomElement() ?? .black)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 76)
                }
            }
        }
        
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
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
